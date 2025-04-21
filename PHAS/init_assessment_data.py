from app import create_app, db
from app.models.assessment.questionnaire_model import Questionnaire, Question, Option
from app.models.assessment.result_model import ResultLevel

app = create_app()

def init_assessment_data():
    """初始化心理测评数据"""
    with app.app_context():
        # 创建PHQ-9抑郁筛查问卷
        phq9 = Questionnaire(
            title='抑郁症筛查量表(PHQ-9)',
            description='PHQ-9是一个简短的抑郁症筛查工具，用于评估个体在过去两周内的抑郁症状频率和严重程度。',
            code='PHQ-9',
            instruction='请选择在过去两周里，您有多少天会出现以下症状？',
            estimated_time=10,
            category='专业量表',
            is_active=True
        )
        db.session.add(phq9)
        db.session.flush()  # 获取ID
        
        # PHQ-9题目和选项
        phq9_questions = [
            '做事时兴趣或愉快感很少',
            '情绪低落、抑郁或绝望',
            '入睡困难、睡不安稳或睡眠过多',
            '疲倦或没有活力',
            '食欲不振或进食过量',
            '觉得自己很糟糕 —— 或觉得自己很失败，或让自己或家人失望',
            '注意力不集中，如看报纸或看电视时',
            '动作或说话缓慢到被人察觉 —— 或正好相反，烦躁或坐立不安，比平常动来动去的情况更严重',
            '有不如死掉或用某种方式伤害自己的念头'
        ]
        
        options = [
            {'content': '完全没有', 'score': 0},
            {'content': '有几天', 'score': 1},
            {'content': '一半以上时间', 'score': 2},
            {'content': '几乎每天', 'score': 3}
        ]
        
        for i, question_content in enumerate(phq9_questions, 1):
            question = Question(
                questionnaire_id=phq9.id,
                content=question_content,
                order=i,
                question_type='radio',
                score_weight=1.0
            )
            db.session.add(question)
            db.session.flush()
            
            for j, opt in enumerate(options, 1):
                option = Option(
                    question_id=question.id,
                    content=opt['content'],
                    order=j,
                    score=opt['score']
                )
                db.session.add(option)
        
        # 添加PHQ-9结果级别
        phq9_levels = [
            {'name': '正常', 'min_score': 0, 'max_score': 4, 
             'description': '您的抑郁症状在正常范围内。', 
             'recommendation': '继续保持良好的情绪和生活习惯。'},
            {'name': '轻度', 'min_score': 5, 'max_score': 9, 
             'description': '您可能有轻度抑郁症状。', 
             'recommendation': '建议进行适当的自我调节，如增加运动、保持规律作息、寻求社交支持等。'},
            {'name': '中度', 'min_score': 10, 'max_score': 14, 
             'description': '您可能有中度抑郁症状，这可能会影响您的日常生活和工作。', 
             'recommendation': '建议咨询心理医生，获取专业支持和指导。'},
            {'name': '重度', 'min_score': 15, 'max_score': 27, 
             'description': '您可能有较严重的抑郁症状，这可能严重影响您的生活质量。', 
             'recommendation': '强烈建议尽快寻求专业心理医生或精神科医生的帮助，进行全面评估和治疗。'}
        ]
        
        for level in phq9_levels:
            result_level = ResultLevel(
                questionnaire_id=phq9.id,
                level_name=level['name'],
                min_score=level['min_score'],
                max_score=level['max_score'],
                description=level['description'],
                recommendation=level['recommendation']
            )
            db.session.add(result_level)
        
        # 创建SAS焦虑自评量表
        sas = Questionnaire(
            title='焦虑自评量表(SAS)',
            description='SAS是一个评估焦虑症状严重程度的工具，用于筛查焦虑障碍及其程度。',
            code='SAS',
            instruction='请根据您在过去一周的感受，选择最符合您情况的选项。',
            estimated_time=15,
            category='专业量表',
            is_active=True
        )
        db.session.add(sas)
        db.session.flush()
        
        # SAS题目和选项
        sas_questions = [
            '我感到比平常更加紧张和焦虑',
            '我无缘无故地感到害怕',
            '我容易心烦意乱或感到恐慌',
            '我感到我好像要崩溃一样',
            '我感到一切都很好，也不会发生什么不幸',
            '我手脚发抖打颤',
            '我因为头痛、颈痛和背痛而苦恼',
            '我感到容易衰弱和疲乏',
            '我感到心平气和，并且容易安静坐着',
            '我感到我的心跳很快',
            '我因为一阵阵头晕而苦恼',
            '我有晕倒发作，或感到要晕倒似的',
            '我呼气吸气都感到很容易',
            '我的手脚麻木和刺痛',
            '我因为胃痛和消化不良而苦恼',
            '我常常要小便',
            '我的手通常是干燥温暖的',
            '我脸红发热',
            '我容易入睡并且一夜睡得很好',
            '我做恶梦'
        ]
        
        sas_options = [
            {'content': '没有或很少时间', 'score': 1},
            {'content': '小部分时间', 'score': 2},
            {'content': '相当多时间', 'score': 3},
            {'content': '绝大部分或全部时间', 'score': 4}
        ]
        
        for i, question_content in enumerate(sas_questions, 1):
            question = Question(
                questionnaire_id=sas.id,
                content=question_content,
                order=i,
                question_type='radio',
                score_weight=1.0 if i not in [5, 9, 13, 17, 19] else -1.0  # 反向计分题
            )
            db.session.add(question)
            db.session.flush()
            
            for j, opt in enumerate(sas_options, 1):
                option = Option(
                    question_id=question.id,
                    content=opt['content'],
                    order=j,
                    score=opt['score']
                )
                db.session.add(option)
        
        # 添加SAS结果级别
        sas_levels = [
            {'name': '正常', 'min_score': 20, 'max_score': 49, 
             'description': '您的焦虑水平在正常范围内。', 
             'recommendation': '继续保持良好的情绪管理和生活习惯。'},
            {'name': '轻度', 'min_score': 50, 'max_score': 59, 
             'description': '您可能有轻度焦虑症状。', 
             'recommendation': '建议学习一些放松技巧，如深呼吸、冥想等，以帮助缓解焦虑感。'},
            {'name': '中度', 'min_score': 60, 'max_score': 69, 
             'description': '您可能有中度焦虑症状，这可能会影响您的日常功能。', 
             'recommendation': '建议咨询心理专业人士，了解焦虑管理策略和可能的治疗选择。'},
            {'name': '重度', 'min_score': 70, 'max_score': 80, 
             'description': '您可能有严重的焦虑症状，这会显著影响您的生活质量。', 
             'recommendation': '强烈建议尽快寻求专业心理医生或精神科医生的评估和治疗。'}
        ]
        
        for level in sas_levels:
            result_level = ResultLevel(
                questionnaire_id=sas.id,
                level_name=level['name'],
                min_score=level['min_score'],
                max_score=level['max_score'],
                description=level['description'],
                recommendation=level['recommendation']
            )
            db.session.add(result_level)
            
        db.session.commit()
        print('心理测评数据初始化完成！')

if __name__ == '__main__':
    init_assessment_data() 