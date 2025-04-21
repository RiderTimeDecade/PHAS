from app import create_app, db
from app.models.user.user_model import User

app = create_app()

def init_db():
    with app.app_context():
        # 创建数据库表
        db.create_all()
        
        # 创建管理员账号
        if not User.query.filter_by(email='admin@example.com').first():
            admin = User(
                username='admin',
                email='admin@example.com',
                password='password',
                gender='male',
                age=30
            )
            db.session.add(admin)
            
        # 创建测试用户
        if not User.query.filter_by(email='user@example.com').first():
            user = User(
                username='testuser',
                email='user@example.com',
                password='password',
                gender='female',
                age=25
            )
            db.session.add(user)
        
        db.session.commit()
        print('数据库初始化完成！')

if __name__ == '__main__':
    init_db() 