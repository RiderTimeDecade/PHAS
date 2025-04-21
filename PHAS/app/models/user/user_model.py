from app import db
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash

class User(UserMixin, db.Model):
    __tablename__ = 'users'
    
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, index=True)
    email = db.Column(db.String(120), unique=True, index=True)
    password_hash = db.Column(db.String(128))
    gender = db.Column(db.String(10))
    age = db.Column(db.Integer)
    is_active = db.Column(db.Boolean, default=True)
    
    def __init__(self, username, email, password, gender=None, age=None):
        self.username = username
        self.email = email
        self.set_password(password)
        self.gender = gender
        self.age = age
    
    def set_password(self, password):
        self.password_hash = generate_password_hash(password)
        
    def check_password(self, password):
        return check_password_hash(self.password_hash, password)
        
    def __repr__(self):
        return f'<User {self.username}>'
