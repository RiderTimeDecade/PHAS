from app import db
from datetime import datetime

class Consultation(db.Model):
    """咨询记录模型"""
    __tablename__ = 'consultations'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    counselor_id = db.Column(db.Integer, db.ForeignKey('counselors.id'), nullable=False)
    status = db.Column(db.String(20), nullable=False, default='scheduled')  # scheduled, in_progress, completed, cancelled
    start_time = db.Column(db.DateTime, nullable=False)
    end_time = db.Column(db.DateTime)
    duration = db.Column(db.Integer, nullable=False)  # 咨询时长（分钟）
    topic = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    rating = db.Column(db.Float)
    feedback = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    # 关系
    user = db.relationship('User', backref=db.backref('consultations', lazy=True))
    counselor = db.relationship('Counselor', backref=db.backref('consultations', lazy=True))
    
    def __repr__(self):
        return f'<Consultation {self.id}>' 