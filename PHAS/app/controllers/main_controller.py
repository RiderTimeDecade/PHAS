from flask import Blueprint, render_template

main_bp = Blueprint('main', __name__)

@main_bp.route('/')
@main_bp.route('/index')
def index():
    """主页路由"""
    modules = [
        {
            'name': '心理测评',
            'description': '填写问卷获取测评结果',
            'icon': 'clipboard-check',
            'url': '/assessment'
        },
        {
            'name': '在线咨询',
            'description': '预约心理咨询师进行视频/文字咨询',
            'icon': 'comment-dots',
            'url': '/consultation'
        },
        {
            'name': '心理教育',
            'description': '观看心理健康课程并参与互动',
            'icon': 'graduation-cap',
            'url': '/education'
        },
        {
            'name': '数据分析',
            'description': '生成个人心理健康报告和分析结果',
            'icon': 'chart-line',
            'url': '/analysis'
        }
    ]
    return render_template('index.html', modules=modules) 