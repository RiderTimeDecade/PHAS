from app import db
from datetime import datetime

class Message(db.Model):
    """聊天消息模型"""
    __tablename__ = 'messages'
    
    id = db.Column(db.Integer, primary_key=True)
    appointment_id = db.Column(db.Integer, db.ForeignKey('appointments.id'), nullable=False)
    sender_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    receiver_id = db.Column(db.Integer, nullable=False)  # 可能是用户或咨询师
    content = db.Column(db.Text, nullable=False)  # 消息内容
    message_type = db.Column(db.String(20), default='text')  # 消息类型：text, image, file
    is_read = db.Column(db.Boolean, default=False)  # 是否已读
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def __repr__(self):
        return f'<Message {self.id}>'
    
    @property
    def is_from_user(self):
        """判断消息是否来自用户"""
        from app.models.user.user_model import User
        return User.query.get(self.sender_id) is not None
