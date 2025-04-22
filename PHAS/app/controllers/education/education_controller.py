from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from flask_login import login_required, current_user
from app.models.education.course_model import Course, Chapter, CourseComment, UserCourse
from app import db
from datetime import datetime
from flask_wtf import FlaskForm

education_bp = Blueprint('education', __name__, url_prefix='/education')

@education_bp.route('/')
@login_required
def index():
    """心理教育首页，显示课程列表"""
    # 获取查询参数
    search = request.args.get('search', '')
    level = request.args.get('level', '')
    tag = request.args.get('tag', '')
    sort = request.args.get('sort', 'newest')
    
    # 构建基本查询
    query = Course.query.filter_by(status='active')
    
    # 应用过滤条件
    if search:
        query = query.filter(Course.title.like(f'%{search}%') | Course.description.like(f'%{search}%'))
    
    if level:
        query = query.filter_by(level=level)
    
    if tag:
        query = query.filter(Course.tags.like(f'%{tag}%'))
    
    # 应用排序
    if sort == 'newest':
        query = query.order_by(Course.created_at.desc())
    elif sort == 'popular':
        query = query.order_by(Course.views.desc())
    elif sort == 'rating':
        query = query.order_by(Course.rating.desc())
    
    # 获取课程列表
    courses = query.all()
    
    # 获取用户正在学习的课程
    user_courses = None
    if current_user.is_authenticated:
        user_courses = UserCourse.query.filter_by(user_id=current_user.id, completed=False).all()
    
    # 获取所有标签
    all_tags = set()
    for course in Course.query.all():
        if course.tags:
            tags = [tag.strip() for tag in course.tags.split(',')]
            all_tags.update(tags)
    
    return render_template('education/index.html', 
                          courses=courses, 
                          user_courses=user_courses,
                          all_tags=sorted(list(all_tags)),
                          search=search,
                          level=level,
                          tag=tag,
                          sort=sort)

@education_bp.route('/course/<int:id>')
@login_required
def course_detail(id):
    """课程详情页面"""
    course = Course.query.get_or_404(id)
    
    # 增加浏览次数
    course.views += 1
    db.session.commit()
    
    # 获取用户的学习进度
    user_course = UserCourse.query.filter_by(user_id=current_user.id, course_id=id).first()
    
    # 获取课程评论
    comments = CourseComment.query.filter_by(course_id=id).order_by(CourseComment.created_at.desc()).all()
    
    # 是否已评论
    has_commented = CourseComment.query.filter_by(user_id=current_user.id, course_id=id).first() is not None
    
    # 创建表单的CSRF令牌
    form = FlaskForm()
    
    return render_template('education/course_detail.html', 
                          course=course, 
                          user_course=user_course,
                          comments=comments,
                          has_commented=has_commented,
                          form=form)

@education_bp.route('/chapter/<int:id>')
@login_required
def chapter(id):
    """章节视频播放页面"""
    chapter = Chapter.query.get_or_404(id)
    course = chapter.course
    
    # 检查是否是免费章节或用户已学习该课程
    user_course = UserCourse.query.filter_by(user_id=current_user.id, course_id=course.id).first()
    
    if not chapter.is_free and not user_course:
        flash('请先开始学习该课程', 'warning')
        return redirect(url_for('education.course_detail', id=course.id))
    
    # 获取前一章和后一章
    prev_chapter = Chapter.query.filter(Chapter.course_id == course.id, Chapter.order < chapter.order).order_by(Chapter.order.desc()).first()
    next_chapter = Chapter.query.filter(Chapter.course_id == course.id, Chapter.order > chapter.order).order_by(Chapter.order).first()
    
    # 如果用户在学习，更新学习进度
    if user_course:
        # 设置当前章节为最后观看的章节
        user_course.last_chapter_id = chapter.id
        
        # 计算进度百分比（简单方式：已完成章节数/总章节数）
        total_chapters = len(course.chapters)
        completed_chapters = chapter.order
        user_course.progress = min(100, round((completed_chapters / total_chapters) * 100, 1))
        
        # 如果是最后一章，标记为已完成
        if not next_chapter and user_course.progress >= 95:
            user_course.completed = True
            user_course.completed_at = datetime.utcnow()
            flash('恭喜你完成了课程学习！', 'success')
        
        db.session.commit()
    
    # 设置默认视频URL
    if not chapter.video_url:
        from flask import url_for
        chapter.default_video_url = url_for('static', filename='video/1.mp4')
    else:
        chapter.default_video_url = None
    
    return render_template('education/chapter.html', 
                          chapter=chapter, 
                          course=course,
                          prev_chapter=prev_chapter,
                          next_chapter=next_chapter,
                          user_course=user_course)

@education_bp.route('/start_course/<int:id>', methods=['POST'])
@login_required
def start_course(id):
    """开始学习课程"""
    # 创建表单的CSRF令牌
    form = FlaskForm()
    if form.validate_on_submit():
        course = Course.query.get_or_404(id)
        
        # 检查是否已经在学习该课程
        user_course = UserCourse.query.filter_by(user_id=current_user.id, course_id=id).first()
        
        if not user_course:
            # 获取第一章
            first_chapter = Chapter.query.filter_by(course_id=id).order_by(Chapter.order).first()
            
            # 创建用户课程记录
            user_course = UserCourse(
                user_id=current_user.id,
                course_id=id,
                last_chapter_id=first_chapter.id if first_chapter else None,
                progress=0.0
            )
            db.session.add(user_course)
            db.session.commit()
            
            flash('成功开始学习课程！', 'success')
        
        # 获取最后观看的章节，如果没有则获取第一章
        if user_course.last_chapter_id:
            chapter_id = user_course.last_chapter_id
        else:
            chapter = Chapter.query.filter_by(course_id=id).order_by(Chapter.order).first()
            chapter_id = chapter.id if chapter else None
        
        if chapter_id:
            return redirect(url_for('education.chapter', id=chapter_id))
    
    return redirect(url_for('education.course_detail', id=id))

@education_bp.route('/add_comment/<int:id>', methods=['POST'])
@login_required
def add_comment(id):
    """添加课程评论"""
    # 创建表单的CSRF令牌
    form = FlaskForm()
    if form.validate_on_submit():
        course = Course.query.get_or_404(id)
        
        # 检查是否已评论
        existing_comment = CourseComment.query.filter_by(user_id=current_user.id, course_id=id).first()
        if existing_comment:
            flash('您已经评论过该课程', 'warning')
            return redirect(url_for('education.course_detail', id=id))
        
        content = request.form.get('content')
        rating = int(request.form.get('rating', 5))
        
        if not content:
            flash('评论内容不能为空', 'danger')
            return redirect(url_for('education.course_detail', id=id))
        
        # 添加评论
        comment = CourseComment(
            course_id=id,
            user_id=current_user.id,
            content=content,
            rating=rating
        )
        db.session.add(comment)
        
        # 更新课程评分（所有评论的平均分）
        comments = CourseComment.query.filter_by(course_id=id).all()
        total_rating = sum(c.rating for c in comments) + rating
        course.rating = round(total_rating / (len(comments) + 1), 1)
        
        db.session.commit()
        
        flash('评论成功！感谢您的反馈', 'success')
    
    return redirect(url_for('education.course_detail', id=id))

@education_bp.route('/interactive/<int:id>')
@login_required
def interactive(id):
    """互动学习页面"""
    chapter = Chapter.query.get_or_404(id)
    course = chapter.course
    
    return render_template('education/interactive.html', 
                          chapter=chapter, 
                          course=course)

@education_bp.route('/update_all_videos')
@login_required
def update_all_videos():
    """更新所有章节视频为默认视频"""
    # 检查是否为管理员
    if not current_user.is_admin:
        flash('您没有权限执行此操作', 'danger')
        return redirect(url_for('education.index'))
    
    # 获取所有章节
    chapters = Chapter.query.all()
    
    # 获取默认视频URL
    default_video_url = url_for('static', filename='video/1.mp4')
    
    # 更新所有章节的视频URL
    update_count = 0
    for chapter in chapters:
        chapter.video_url = default_video_url
        update_count += 1
    
    # 提交更改
    db.session.commit()
    
    flash(f'成功更新 {update_count} 个章节的视频为默认视频', 'success')
    return redirect(url_for('education.index'))
