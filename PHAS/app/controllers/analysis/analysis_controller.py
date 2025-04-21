from flask import Blueprint, render_template

analysis_bp = Blueprint('analysis', __name__, url_prefix='/analysis')

@analysis_bp.route('/')
def index():
    """数据分析首页"""
    return render_template('analysis/index.html')

@analysis_bp.route('/report/<int:id>')
def report(id):
    """报告页面"""
    return render_template('analysis/report.html', report_id=id)

@analysis_bp.route('/analytics')
def analytics():
    """分析结果页面"""
    return render_template('analysis/analytics.html')
