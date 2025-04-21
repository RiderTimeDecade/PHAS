from flask import Blueprint, render_template, request, jsonify, flash, redirect, url_for, session
from flask_login import login_required, current_user
from app import db
from app.models.assessment.questionnaire_model import Questionnaire, Question, Option
from app.models.assessment.result_model import Result, Answer, ResultLevel
import json
import random

assessment_bp = Blueprint('assessment', __name__, url_prefix='/assessment')

@assessment_bp.route('/')
def index():
    """心理测评首页"""
    # 获取所有可用问卷
    questionnaires = Questionnaire.query.filter_by(is_active=True).all()
    
    # 如果用户已登录，获取最近的测评记录
    user_assessments = None
    if current_user.is_authenticated:
        user_assessments = Result.query.filter_by(user_id=current_user.id)\
                              .order_by(Result.created_at.desc())\
                              .limit(5).all()
    
    return render_template('assessment/index.html', 
                          questionnaires=questionnaires,
                          user_assessments=user_assessments)

@assessment_bp.route('/questionnaire/<int:id>')
def questionnaire(id):
    """问卷页面"""
    # 获取指定问卷
    questionnaire = Questionnaire.query.get_or_404(id)
    
    # 获取问卷下的所有问题和选项
    questions = Question.query.filter_by(questionnaire_id=id)\
                      .order_by(Question.order).all()
    
    # 构建问题选项数据
    questions_data = []
    for q in questions:
        options = Option.query.filter_by(question_id=q.id)\
                       .order_by(Option.order).all()
        questions_data.append({
            'question': q,
            'options': options
        })
    
    return render_template('assessment/questionnaire.html', 
                          questionnaire=questionnaire,
                          questions_data=questions_data)

@assessment_bp.route('/submit/<int:id>', methods=['POST'])
def submit_questionnaire(id):
    """提交问卷"""
    # 获取问卷
    questionnaire = Questionnaire.query.get_or_404(id)
    
    # 如果用户已登录，保存结果到数据库
    if current_user.is_authenticated:
        # 创建结果记录
        result = Result(
            user_id=current_user.id,
            questionnaire_id=id
        )
        db.session.add(result)
        db.session.flush()  # 获取result.id
        
        # 解析表单数据并保存答案
        total_score = 0
        for key, value in request.form.items():
            if key.startswith('question_'):
                question_id = int(key.split('_')[1])
                question = Question.query.get(question_id)
                
                if question.question_type == 'text':
                    # 文本题
                    answer = Answer(
                        result_id=result.id,
                        question_id=question_id,
                        text_answer=value,
                        score=0  # 文本题通常不计分
                    )
                else:
                    # 单选或多选题
                    option_id = int(value)
                    option = Option.query.get(option_id)
                    answer = Answer(
                        result_id=result.id,
                        question_id=question_id,
                        selected_option_id=option_id,
                        score=option.score * question.score_weight
                    )
                    total_score += answer.score
                
                db.session.add(answer)
        
        # 根据总分判断结果级别
        result.total_score = total_score
        result_level = ResultLevel.query.filter_by(questionnaire_id=id)\
                               .filter(ResultLevel.min_score <= total_score,
                                       ResultLevel.max_score >= total_score)\
                               .first()
        
        if result_level:
            result.result_level = result_level.level_name
            result.analysis = result_level.description
            result.recommendations = result_level.recommendation
        
        db.session.commit()
        
        # 重定向到结果页面
        return redirect(url_for('assessment.result', id=result.id))
    else:
        # 未登录用户，计算总分并返回临时结果
        answers = request.form.to_dict()
        try:
            # 计算总分
            total_score = calculate_temp_score(id, answers)
            
            # 根据总分获取结果级别
            result_level = ResultLevel.query.filter_by(questionnaire_id=id)\
                                   .filter(ResultLevel.min_score <= total_score,
                                          ResultLevel.max_score >= total_score)\
                                   .first()
            
            # 临时会话中保存结果
            temp_result = {
                'questionnaire_id': id,
                'questionnaire_title': questionnaire.title,
                'total_score': total_score,
                'result_level': result_level.level_name if result_level else '未知',
                'analysis': result_level.description if result_level else '',
                'recommendations': result_level.recommendation if result_level else ''
            }
            
            # 使用会话保存临时结果
            if 'temp_results' not in session:
                session['temp_results'] = []
            
            session['temp_results'].append(temp_result)
            session.modified = True
            
            # 重定向到临时结果页面
            return redirect(url_for('assessment.temp_result'))
            
        except Exception as e:
            flash(f'处理问卷时出错: {str(e)}', 'danger')
            return redirect(url_for('assessment.index'))

@assessment_bp.route('/result/<int:id>')
@login_required
def result(id):
    """测评结果页面"""
    # 获取测评结果
    result = Result.query.get_or_404(id)
    
    # 检查是否是当前用户的结果
    if result.user_id != current_user.id:
        flash('您无权查看此测评结果', 'danger')
        return redirect(url_for('assessment.index'))
    
    # 获取问卷信息
    questionnaire = Questionnaire.query.get(result.questionnaire_id)
    
    # 获取答案详情
    answers = Answer.query.filter_by(result_id=id).all()
    answer_details = []
    
    for answer in answers:
        question = Question.query.get(answer.question_id)
        if answer.selected_option_id:
            option = Option.query.get(answer.selected_option_id)
            answer_details.append({
                'question': question.content,
                'answer': option.content,
                'score': answer.score
            })
        else:
            answer_details.append({
                'question': question.content,
                'answer': answer.text_answer,
                'score': 0
            })
    
    return render_template('assessment/result.html', 
                          result=result,
                          questionnaire=questionnaire,
                          answer_details=answer_details)

@assessment_bp.route('/temp_result')
def temp_result():
    """临时测评结果页面（未登录用户）"""
    if 'temp_results' not in session or not session['temp_results']:
        flash('找不到测评结果', 'warning')
        return redirect(url_for('assessment.index'))
    
    temp_result = session['temp_results'][-1]  # 获取最新的临时结果
    
    return render_template('assessment/temp_result.html', 
                          result=temp_result)

@assessment_bp.route('/history')
@login_required
def history():
    """测评历史记录"""
    results = Result.query.filter_by(user_id=current_user.id)\
                   .order_by(Result.created_at.desc()).all()
    
    questionnaires = {}
    for result in results:
        if result.questionnaire_id not in questionnaires:
            questionnaires[result.questionnaire_id] = Questionnaire.query.get(result.questionnaire_id)
    
    return render_template('assessment/history.html', 
                          results=results,
                          questionnaires=questionnaires)

@assessment_bp.route('/auto_test/<int:id>')
@login_required
def auto_test(id):
    """自动测试问卷（开发者功能）"""
    # 获取指定问卷
    questionnaire = Questionnaire.query.get_or_404(id)
    
    # 获取问卷下的所有问题和选项
    questions = Question.query.filter_by(questionnaire_id=id).order_by(Question.order).all()
    
    # 创建结果记录
    result = Result(
        user_id=current_user.id,
        questionnaire_id=id
    )
    db.session.add(result)
    db.session.flush()  # 获取result.id
    
    # 随机选择答案并计算总分
    total_score = 0
    for question in questions:
        if question.question_type == 'text':
            # 文本题随机生成回答
            text_answers = [
                "这是一个自动测试生成的文本回答。",
                "我感觉这个问题很有意思。",
                "这只是一个测试回答，用于系统测试。",
                "我没有特别的想法。",
                "我认为这对我的情况不适用。"
            ]
            answer = Answer(
                result_id=result.id,
                question_id=question.id,
                text_answer=random.choice(text_answers),
                score=0  # 文本题通常不计分
            )
        else:
            # 单选或多选题随机选择一个选项
            options = Option.query.filter_by(question_id=question.id).all()
            option = random.choice(options)
            answer = Answer(
                result_id=result.id,
                question_id=question.id,
                selected_option_id=option.id,
                score=option.score * question.score_weight
            )
            total_score += answer.score
        
        db.session.add(answer)
    
    # 根据总分判断结果级别
    result.total_score = total_score
    result_level = ResultLevel.query.filter_by(questionnaire_id=id)\
                           .filter(ResultLevel.min_score <= total_score,
                                  ResultLevel.max_score >= total_score)\
                           .first()
    
    if result_level:
        result.result_level = result_level.level_name
        result.analysis = result_level.description
        result.recommendations = result_level.recommendation
    
    db.session.commit()
    
    flash(f'已自动完成《{questionnaire.title}》测评，总分: {total_score}', 'success')
    return redirect(url_for('assessment.result', id=result.id))

def calculate_temp_score(questionnaire_id, answers):
    """计算临时分数（未登录用户）"""
    total_score = 0
    
    for key, value in answers.items():
        if key.startswith('question_'):
            question_id = int(key.split('_')[1])
            question = Question.query.get(question_id)
            
            if question.question_type != 'text':
                option_id = int(value)
                option = Option.query.get(option_id)
                score = option.score * question.score_weight
                total_score += score
    
    return total_score
