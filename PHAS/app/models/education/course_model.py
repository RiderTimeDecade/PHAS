from app import db
from datetime import datetime

class Course(db.Model):
    """课程模型"""
    __tablename__ = 'courses'
    
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=False)
    cover_image = db.Column(db.String(200))  # 封面图片URL
    level = db.Column(db.String(20), nullable=False)  # 难度级别：beginner, intermediate, advanced
    duration = db.Column(db.Integer, nullable=False)  # 课程时长（分钟）
    instructor = db.Column(db.String(50), nullable=False)  # 讲师
    tags = db.Column(db.String(200))  # 标签,逗号分隔
    views = db.Column(db.Integer, default=0)  # 观看次数
    rating = db.Column(db.Float, default=5.0)  # 评分
    status = db.Column(db.String(20), default='active')  # 状态：active, inactive
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    # 课程章节
    chapters = db.relationship('Chapter', backref='course', lazy=True, cascade='all, delete-orphan')
    
    # 课程评论
    comments = db.relationship('CourseComment', backref='course', lazy=True, cascade='all, delete-orphan')
    
    def __repr__(self):
        return f'<Course {self.title}>'

class Chapter(db.Model):
    """课程章节模型"""
    __tablename__ = 'chapters'
    
    id = db.Column(db.Integer, primary_key=True)
    course_id = db.Column(db.Integer, db.ForeignKey('courses.id'), nullable=False)
    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    video_url = db.Column(db.String(200))  # 视频URL
    duration = db.Column(db.Integer)  # 章节时长（分钟）
    order = db.Column(db.Integer, nullable=False)  # 排序顺序
    is_free = db.Column(db.Boolean, default=False)  # 是否免费章节
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def __repr__(self):
        return f'<Chapter {self.title}>'

class CourseComment(db.Model):
    """课程评论模型"""
    __tablename__ = 'course_comments'
    
    id = db.Column(db.Integer, primary_key=True)
    course_id = db.Column(db.Integer, db.ForeignKey('courses.id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    content = db.Column(db.Text, nullable=False)
    rating = db.Column(db.Integer, nullable=False)  # 1-5星评分
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    # 用户关系
    user = db.relationship('User', backref='course_comments')
    
    def __repr__(self):
        return f'<CourseComment {self.id}>'

class UserCourse(db.Model):
    """用户课程关联模型，记录用户的学习进度"""
    __tablename__ = 'user_courses'
    
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    course_id = db.Column(db.Integer, db.ForeignKey('courses.id'), nullable=False)
    progress = db.Column(db.Float, default=0.0)  # 学习进度（百分比）
    last_chapter_id = db.Column(db.Integer, db.ForeignKey('chapters.id'))  # 上次学习的章节
    completed = db.Column(db.Boolean, default=False)  # 是否完成
    started_at = db.Column(db.DateTime, default=datetime.utcnow)
    completed_at = db.Column(db.DateTime)  # 完成时间
    
    # 关系
    user = db.relationship('User', backref='user_courses')
    course = db.relationship('Course', backref='user_courses')
    last_chapter = db.relationship('Chapter')
    
    def __repr__(self):
        return f'<UserCourse {self.user_id}:{self.course_id}>'
