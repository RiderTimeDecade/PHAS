from flask import Blueprint, render_template

education_bp = Blueprint('education', __name__, url_prefix='/education')

@education_bp.route('/')
def index():
    """心理教育首页"""
    return render_template('education/index.html')

@education_bp.route('/course/<int:id>')
def course_detail(id):
    """课程详情页面"""
    return render_template('education/course_detail.html', course_id=id)

@education_bp.route('/interactive/<int:id>')
def interactive(id):
    """互动学习页面"""
    return render_template('education/interactive.html', interactive_id=id)
