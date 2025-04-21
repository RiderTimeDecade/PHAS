from flask import Blueprint, render_template

consultation_bp = Blueprint('consultation', __name__, url_prefix='/consultation')

@consultation_bp.route('/')
def index():
    """在线咨询首页"""
    return render_template('consultation/index.html')

@consultation_bp.route('/appointment')
def appointment():
    """预约页面"""
    return render_template('consultation/appointment.html')

@consultation_bp.route('/chat/<int:id>')
def chat(id):
    """文字咨询页面"""
    return render_template('consultation/chat.html', chat_id=id)

@consultation_bp.route('/video/<int:id>')
def video(id):
    """视频咨询页面"""
    return render_template('consultation/video.html', video_id=id)
