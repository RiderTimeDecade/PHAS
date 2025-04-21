from flask import Blueprint, render_template, redirect, url_for, flash, request
from flask_login import login_user, logout_user, login_required, current_user
from app import db
from app.models.user.user_model import User

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    """用户登录页面"""
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
        
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        remember = True if request.form.get('remember') else False
        
        user = User.query.filter_by(email=email).first()
        
        if user and user.check_password(password):
            login_user(user, remember=remember)
            next_page = request.args.get('next')
            flash('登录成功！', 'success')
            return redirect(next_page or url_for('main.index'))
        else:
            flash('邮箱或密码错误，请重试。', 'danger')
    
    return render_template('auth/login.html')

@auth_bp.route('/register', methods=['GET', 'POST'])
def register():
    """用户注册页面"""
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
        
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        confirm_password = request.form.get('confirm_password')
        gender = request.form.get('gender')
        age = request.form.get('age')
        
        if not all([username, email, password, confirm_password]):
            flash('请填写所有必填字段。', 'danger')
            return render_template('auth/register.html')
            
        if password != confirm_password:
            flash('两次输入的密码不一致。', 'danger')
            return render_template('auth/register.html')
            
        if User.query.filter_by(email=email).first():
            flash('该邮箱已被注册。', 'danger')
            return render_template('auth/register.html')
            
        if User.query.filter_by(username=username).first():
            flash('该用户名已被使用。', 'danger')
            return render_template('auth/register.html')
        
        # 创建新用户
        user = User(username=username, email=email, password=password, gender=gender, age=age)
        db.session.add(user)
        db.session.commit()
        
        flash('注册成功！请登录。', 'success')
        return redirect(url_for('auth.login'))
    
    return render_template('auth/register.html')

@auth_bp.route('/logout')
@login_required
def logout():
    """退出登录"""
    logout_user()
    flash('您已成功退出登录', 'success')
    return redirect(url_for('main.index'))

@auth_bp.route('/profile')
@login_required
def profile():
    """用户资料页面"""
    return render_template('auth/profile.html')
