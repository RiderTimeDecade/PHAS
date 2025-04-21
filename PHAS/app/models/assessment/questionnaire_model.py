from app import db
from datetime import datetime

class Questionnaire(db.Model):
    """心理测评问卷模型"""
    __tablename__ = 'questionnaires'
    
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    code = db.Column(db.String(20), unique=True)  # 问卷代码，如PHQ-9、SAS等
    instruction = db.Column(db.Text)  # 问卷说明
    estimated_time = db.Column(db.Integer)  # 预计完成时间（分钟）
    category = db.Column(db.String(50))  # 问卷分类：专业量表、趣味测试等
    is_active = db.Column(db.Boolean, default=True)
    created_at = db.Column(db.DateTime, default=datetime.now)
    updated_at = db.Column(db.DateTime, default=datetime.now, onupdate=datetime.now)
    
    # 关联问题
    questions = db.relationship('Question', backref='questionnaire', lazy='dynamic', cascade='all, delete-orphan')
    # 关联测评结果
    results = db.relationship('Result', backref='questionnaire', lazy='dynamic')
    
    def __repr__(self):
        return f'<Questionnaire {self.title}>'
    
    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'code': self.code,
            'instruction': self.instruction,
            'estimated_time': self.estimated_time,
            'category': self.category,
            'is_active': self.is_active
        }

class Question(db.Model):
    """问卷问题模型"""
    __tablename__ = 'questions'
    
    id = db.Column(db.Integer, primary_key=True)
    questionnaire_id = db.Column(db.Integer, db.ForeignKey('questionnaires.id'), nullable=False)
    content = db.Column(db.Text, nullable=False)  # 问题内容
    order = db.Column(db.Integer, nullable=False)  # 问题顺序
    question_type = db.Column(db.String(20), nullable=False)  # 问题类型：单选、多选、文本等
    score_weight = db.Column(db.Float, default=1.0)  # 问题权重
    created_at = db.Column(db.DateTime, default=datetime.now)
    
    # 关联选项
    options = db.relationship('Option', backref='question', lazy='dynamic', cascade='all, delete-orphan')
    
    def __repr__(self):
        return f'<Question {self.id}>'
    
    def to_dict(self):
        return {
            'id': self.id,
            'content': self.content,
            'order': self.order,
            'question_type': self.question_type,
            'options': [option.to_dict() for option in self.options]
        }

class Option(db.Model):
    """问题选项模型"""
    __tablename__ = 'options'
    
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('questions.id'), nullable=False)
    content = db.Column(db.String(255), nullable=False)  # 选项内容
    order = db.Column(db.Integer, nullable=False)  # 选项顺序
    score = db.Column(db.Float, default=0)  # 选项分值
    
    def __repr__(self):
        return f'<Option {self.id}>'
    
    def to_dict(self):
        return {
            'id': self.id,
            'content': self.content,
            'order': self.order,
            'score': self.score
        }
