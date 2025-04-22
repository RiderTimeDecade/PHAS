from app import db
from datetime import datetime

class Appointment(db.Model):
    """预约模型"""
    __tablename__ = 'appointments'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    counselor_id = db.Column(db.Integer, db.ForeignKey('counselors.id'), nullable=False)
    appointment_date = db.Column(db.Date, nullable=False)  # 预约日期
    start_time = db.Column(db.Time, nullable=False)  # 开始时间
    end_time = db.Column(db.Time, nullable=False)  # 结束时间
    type = db.Column(db.String(20), nullable=False)  # 咨询类型：video, text
    status = db.Column(db.String(20), default='pending')  # 状态：pending, confirmed, canceled, completed
    notes = db.Column(db.Text)  # 备注信息
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    # 预约关联的聊天消息
    messages = db.relationship('Message', backref='appointment', lazy=True)
    
    def __repr__(self):
        return f'<Appointment {self.id}>'
