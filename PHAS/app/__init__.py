from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager

# 初始化扩展
db = SQLAlchemy()
login_manager = LoginManager()

def create_app():
    app = Flask(__name__)
    
    # 加载配置
    app.config.from_object('config.config.DevelopmentConfig')
    
    # 初始化扩展
    db.init_app(app)
    login_manager.init_app(app)
    login_manager.login_view = 'auth.login'
    
    # 注册user_loader回调函数
    from app.models.user.user_model import User
    
    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(int(user_id))
    
    # 注册蓝图
    from app.controllers.user.user_controller import auth_bp
    app.register_blueprint(auth_bp)
    
    from app.controllers.assessment.assessment_controller import assessment_bp
    app.register_blueprint(assessment_bp)
    
    from app.controllers.consultation.consultation_controller import consultation_bp
    app.register_blueprint(consultation_bp)
    
    from app.controllers.education.education_controller import education_bp
    app.register_blueprint(education_bp)
    
    from app.controllers.analysis.analysis_controller import analysis_bp
    app.register_blueprint(analysis_bp)
    
    # 注册主页路由
    from app.controllers.main_controller import main_bp
    app.register_blueprint(main_bp)
    
    return app
