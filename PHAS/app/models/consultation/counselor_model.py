from app import db
from datetime import datetime

class Counselor(db.Model):
    """咨询师模型"""
    __tablename__ = 'counselors'
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    gender = db.Column(db.String(10), nullable=False)
    title = db.Column(db.String(50), nullable=False)  # 职称
    specialties = db.Column(db.String(200), nullable=False)  # 专长领域
    introduction = db.Column(db.Text, nullable=False)  # 简介
    avatar = db.Column(db.String(200))  # 头像URL
    experience_years = db.Column(db.Integer, default=0)  # 工作经验年限
    consultation_count = db.Column(db.Integer, default=0)  # 咨询次数
    rating = db.Column(db.Float, default=5.0)  # 评分
    status = db.Column(db.String(20), default='active')  # 状态：active, inactive
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    # 咨询师的预约关系
    appointments = db.relationship('Appointment', backref='counselor', lazy=True)
    
    def __repr__(self):
        return f'<Counselor {self.name}>' 