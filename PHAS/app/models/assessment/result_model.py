from app import db
from datetime import datetime

class Result(db.Model):
    """测评结果模型"""
    __tablename__ = 'results'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    questionnaire_id = db.Column(db.Integer, db.ForeignKey('questionnaires.id'), nullable=False)
    total_score = db.Column(db.Float)  # 总分
    result_level = db.Column(db.String(20))  # 结果级别：正常、轻度、中度、重度等
    analysis = db.Column(db.Text)  # 结果分析
    recommendations = db.Column(db.Text)  # 建议
    created_at = db.Column(db.DateTime, default=datetime.now)
    
    # 关联答案
    answers = db.relationship('Answer', backref='result', lazy='dynamic', cascade='all, delete-orphan')
    
    def __repr__(self):
        return f'<Result {self.id}>'
    
    def to_dict(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'questionnaire_id': self.questionnaire_id,
            'total_score': self.total_score,
            'result_level': self.result_level,
            'analysis': self.analysis,
            'recommendations': self.recommendations,
            'created_at': self.created_at.strftime('%Y-%m-%d %H:%M:%S')
        }

class Answer(db.Model):
    """用户答案模型"""
    __tablename__ = 'answers'
    
    id = db.Column(db.Integer, primary_key=True)
    result_id = db.Column(db.Integer, db.ForeignKey('results.id'), nullable=False)
    question_id = db.Column(db.Integer, db.ForeignKey('questions.id'), nullable=False)
    selected_option_id = db.Column(db.Integer, db.ForeignKey('options.id'))  # 单选、多选题选中的选项
    text_answer = db.Column(db.Text)  # 文本题答案
    score = db.Column(db.Float)  # 该题得分
    created_at = db.Column(db.DateTime, default=datetime.now)
    
    # 外键关系
    question = db.relationship('Question')
    selected_option = db.relationship('Option')
    
    def __repr__(self):
        return f'<Answer {self.id}>'
    
    def to_dict(self):
        return {
            'id': self.id,
            'question_id': self.question_id,
            'selected_option_id': self.selected_option_id,
            'text_answer': self.text_answer,
            'score': self.score
        }

class ResultLevel(db.Model):
    """结果级别定义模型"""
    __tablename__ = 'result_levels'
    
    id = db.Column(db.Integer, primary_key=True)
    questionnaire_id = db.Column(db.Integer, db.ForeignKey('questionnaires.id'), nullable=False)
    level_name = db.Column(db.String(20), nullable=False)  # 级别名称：正常、轻度、中度、重度等
    min_score = db.Column(db.Float, nullable=False)  # 最低分数
    max_score = db.Column(db.Float, nullable=False)  # 最高分数
    description = db.Column(db.Text)  # 描述
    recommendation = db.Column(db.Text)  # 建议
    
    def __repr__(self):
        return f'<ResultLevel {self.level_name}>'
    
    def to_dict(self):
        return {
            'id': self.id,
            'level_name': self.level_name,
            'min_score': self.min_score,
            'max_score': self.max_score,
            'description': self.description,
            'recommendation': self.recommendation
        }
