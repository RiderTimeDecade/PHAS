from app import create_app, db
from app.models.user.user_model import User
from app.models.consultation.counselor_model import Counselor
from app.models.education.course_model import Course, Chapter
from app.models.consultation.consultation_model import Consultation
from app.models.assessment.questionnaire_model import Questionnaire, Question, Option
from datetime import datetime, timedelta

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
        
        # 添加测试咨询师
        create_test_counselors()
        
        # 添加测试课程
        create_test_courses()
        
        # 添加测试咨询记录
        create_test_consultations()
        
        # 添加测试问卷
        create_test_questionnaires()
        
        db.session.commit()
        print('数据库初始化完成！')

def create_test_counselors():
    """创建测试咨询师数据"""
    if not Counselor.query.filter_by(name='张伟').first():
        counselor1 = Counselor(
            name='张伟',
            gender='male',
            title='资深心理咨询师',
            specialties='压力管理,情绪调节,人际关系',
            introduction='张伟老师拥有10年心理咨询经验，擅长帮助来访者处理压力和情绪问题，构建健康的人际关系。',
            avatar='https://randomuser.me/api/portraits/men/32.jpg',
            experience_years=10,
            consultation_count=120,
            rating=4.8
        )
        db.session.add(counselor1)
    
    if not Counselor.query.filter_by(name='李娜').first():
        counselor2 = Counselor(
            name='李娜',
            gender='female',
            title='青少年心理辅导专家',
            specialties='青少年心理,家庭关系,学习困扰',
            introduction='李娜老师专注于青少年心理健康领域，擅长处理青春期心理问题、亲子关系和学习困扰。',
            avatar='https://randomuser.me/api/portraits/women/46.jpg',
            experience_years=8,
            consultation_count=98,
            rating=4.6
        )
        db.session.add(counselor2)
    
    if not Counselor.query.filter_by(name='王强').first():
        counselor3 = Counselor(
            name='王强',
            gender='male',
            title='婚姻家庭咨询师',
            specialties='婚姻关系,家庭冲突,情感困扰',
            introduction='王强老师是婚姻家庭咨询专家，致力于帮助夫妻重建健康的沟通方式，解决婚姻中的情感困扰。',
            avatar='https://randomuser.me/api/portraits/men/56.jpg',
            experience_years=12,
            consultation_count=145,
            rating=4.9
        )
        db.session.add(counselor3)

def create_test_consultations():
    """创建测试咨询记录"""
    # 获取测试用户和咨询师
    user = User.query.filter_by(email='user@example.com').first()
    counselor1 = Counselor.query.filter_by(name='张伟').first()
    counselor2 = Counselor.query.filter_by(name='李娜').first()
    
    if not Consultation.query.first():
        # 创建已完成的咨询
        consultation1 = Consultation(
            user_id=user.id,
            counselor_id=counselor1.id,
            status='completed',
            start_time=datetime.now() - timedelta(days=7),
            end_time=datetime.now() - timedelta(days=7, hours=1),
            duration=60,
            topic='压力管理',
            description='最近工作压力大，睡眠质量下降，寻求缓解压力的方法',
            rating=4.5,
            feedback='咨询师很有耐心，提供了很多实用的建议，帮助我更好地管理压力'
        )
        db.session.add(consultation1)
        
        # 创建进行中的咨询
        consultation2 = Consultation(
            user_id=user.id,
            counselor_id=counselor2.id,
            status='in_progress',
            start_time=datetime.now() - timedelta(days=3),
            duration=45,
            topic='人际关系',
            description='与同事相处有困难，经常感到被孤立'
        )
        db.session.add(consultation2)
        
        # 创建预约中的咨询
        consultation3 = Consultation(
            user_id=user.id,
            counselor_id=counselor1.id,
            status='scheduled',
            start_time=datetime.now() + timedelta(days=2),
            duration=60,
            topic='情绪调节',
            description='情绪波动较大，希望学习情绪管理的方法'
        )
        db.session.add(consultation3)

def create_test_courses():
    """创建测试课程数据"""
    if not Course.query.filter_by(title='情绪管理入门').first():
        course1 = Course(
            title='情绪管理入门',
            description='本课程将帮助您了解情绪的本质，掌握情绪管理的基本技能，培养积极健康的心态。',
            cover_image='https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
            level='beginner',
            duration=120,
            instructor='张伟',
            tags='情绪管理,心理健康,压力缓解',
            views=256,
            rating=4.7
        )
        db.session.add(course1)
        db.session.flush()
        
        # 添加章节
        chapters1 = [
            Chapter(course_id=course1.id, title='认识情绪', description='了解情绪的种类和作用', video_url=None, duration=15, order=1, is_free=True),
            Chapter(course_id=course1.id, title='情绪觉察', description='提高对自身情绪的觉察能力', video_url=None, duration=20, order=2),
            Chapter(course_id=course1.id, title='情绪调节技巧', description='学习有效的情绪调节方法', video_url=None, duration=25, order=3),
            Chapter(course_id=course1.id, title='处理负面情绪', description='如何应对焦虑、抑郁等负面情绪', video_url=None, duration=30, order=4),
            Chapter(course_id=course1.id, title='培养积极心态', description='构建积极健康的心理状态', video_url=None, duration=30, order=5)
        ]
        db.session.add_all(chapters1)
    
    if not Course.query.filter_by(title='有效的人际沟通').first():
        course2 = Course(
            title='有效的人际沟通',
            description='提升沟通技巧，构建和谐人际关系，解决人际交往中的冲突和困扰。',
            cover_image='https://images.unsplash.com/photo-1528605248644-14dd04022da1',
            level='intermediate',
            duration=180,
            instructor='李娜',
            tags='人际沟通,社交技巧,冲突处理',
            views=198,
            rating=4.5
        )
        db.session.add(course2)
        db.session.flush()
        
        # 添加章节
        chapters2 = [
            Chapter(course_id=course2.id, title='沟通的基本要素', description='了解有效沟通的关键要素', video_url='/static/video/1.mp4', duration=20, order=1, is_free=True),
            Chapter(course_id=course2.id, title='倾听的艺术', description='提高积极倾听的能力', video_url='/static/video/1.mp4', duration=25, order=2),
            Chapter(course_id=course2.id, title='表达自我的技巧', description='学习清晰自信地表达', video_url='/static/video/1.mp4', duration=30, order=3),
            Chapter(course_id=course2.id, title='处理人际冲突', description='冲突解决的方法和策略', video_url='/static/video/1.mp4', duration=35, order=4),
            Chapter(course_id=course2.id, title='建立良好的人际关系', description='如何维护和发展健康的人际关系', video_url='/static/video/1.mp4', duration=30, order=5),
            Chapter(course_id=course2.id, title='职场人际沟通', description='职场中的沟通技巧和策略', video_url='/static/video/1.mp4', duration=40, order=6)
        ]
        db.session.add_all(chapters2)
    
    if not Course.query.filter_by(title='压力管理与自我关怀').first():
        course3 = Course(
            title='压力管理与自我关怀',
            description='学习识别压力源，掌握减压技巧，培养自我关怀的习惯，提高心理韧性。',
            cover_image='https://images.unsplash.com/photo-1540317580384-e5d43867caa6',
            level='beginner',
            duration=150,
            instructor='王强',
            tags='压力管理,自我关怀,心理韧性',
            views=172,
            rating=4.8
        )
        db.session.add(course3)
        db.session.flush()
        
        # 添加章节
        chapters3 = [
            Chapter(course_id=course3.id, title='认识压力', description='了解压力的本质和影响', video_url='/static/video/1.mp4', duration=15, order=1, is_free=True),
            Chapter(course_id=course3.id, title='压力源识别', description='学会识别生活中的压力源', video_url='/static/video/1.mp4', duration=20, order=2),
            Chapter(course_id=course3.id, title='身体减压技巧', description='通过身体放松缓解压力', video_url='/static/video/1.mp4', duration=25, order=3),
            Chapter(course_id=course3.id, title='思维减压方法', description='调整认知方式减轻压力', video_url='/static/video/1.mp4', duration=30, order=4),
            Chapter(course_id=course3.id, title='自我关怀实践', description='培养自我关怀的习惯和态度', video_url='/static/video/1.mp4', duration=30, order=5),
            Chapter(course_id=course3.id, title='建立支持系统', description='利用社会支持缓解压力', video_url='/static/video/1.mp4', duration=30, order=6)
        ]
        db.session.add_all(chapters3)

def create_test_questionnaires():
    """创建测试问卷数据"""
    # PHQ-9抑郁量表
    if not Questionnaire.query.filter_by(code='PHQ-9').first():
        phq9 = Questionnaire(
            title='PHQ-9抑郁症状自评量表',
            description='PHQ-9是一个简单有效的抑郁症状筛查工具，包含9个问题，用于评估过去两周内的抑郁症状。',
            code='PHQ-9',
            instruction='请根据过去两周的情况，选择最符合您状态的选项。',
            estimated_time=5,
            category='专业量表'
        )
        db.session.add(phq9)
        db.session.flush()
        
        # 添加问题
        questions = [
            {
                'content': '做事时提不起劲或没有兴趣',
                'order': 1,
                'options': [
                    {'content': '完全没有', 'score': 0},
                    {'content': '有几天', 'score': 1},
                    {'content': '一半以上的天数', 'score': 2},
                    {'content': '几乎每天', 'score': 3}
                ]
            },
            {
                'content': '感到心情低落、沮丧或绝望',
                'order': 2,
                'options': [
                    {'content': '完全没有', 'score': 0},
                    {'content': '有几天', 'score': 1},
                    {'content': '一半以上的天数', 'score': 2},
                    {'content': '几乎每天', 'score': 3}
                ]
            },
            {
                'content': '入睡困难、睡不安稳或睡眠过多',
                'order': 3,
                'options': [
                    {'content': '完全没有', 'score': 0},
                    {'content': '有几天', 'score': 1},
                    {'content': '一半以上的天数', 'score': 2},
                    {'content': '几乎每天', 'score': 3}
                ]
            }
        ]
        
        for q_data in questions:
            question = Question(
                questionnaire_id=phq9.id,
                content=q_data['content'],
                order=q_data['order'],
                question_type='single_choice'
            )
            db.session.add(question)
            db.session.flush()
            
            # 添加选项
            for o_data in q_data['options']:
                option = Option(
                    question_id=question.id,
                    content=o_data['content'],
                    order=q_data['options'].index(o_data) + 1,
                    score=o_data['score']
                )
                db.session.add(option)
    
    # GAD-7焦虑量表
    if not Questionnaire.query.filter_by(code='GAD-7').first():
        gad7 = Questionnaire(
            title='GAD-7焦虑症状自评量表',
            description='GAD-7是一个简短的焦虑症状筛查工具，用于评估过去两周内的焦虑症状。',
            code='GAD-7',
            instruction='请根据过去两周的情况，选择最符合您状态的选项。',
            estimated_time=3,
            category='专业量表'
        )
        db.session.add(gad7)
        db.session.flush()
        
        # 添加问题
        questions = [
            {
                'content': '感到紧张、焦虑或烦躁',
                'order': 1,
                'options': [
                    {'content': '完全没有', 'score': 0},
                    {'content': '有几天', 'score': 1},
                    {'content': '一半以上的天数', 'score': 2},
                    {'content': '几乎每天', 'score': 3}
                ]
            },
            {
                'content': '无法停止或控制担忧',
                'order': 2,
                'options': [
                    {'content': '完全没有', 'score': 0},
                    {'content': '有几天', 'score': 1},
                    {'content': '一半以上的天数', 'score': 2},
                    {'content': '几乎每天', 'score': 3}
                ]
            }
        ]
        
        for q_data in questions:
            question = Question(
                questionnaire_id=gad7.id,
                content=q_data['content'],
                order=q_data['order'],
                question_type='single_choice'
            )
            db.session.add(question)
            db.session.flush()
            
            # 添加选项
            for o_data in q_data['options']:
                option = Option(
                    question_id=question.id,
                    content=o_data['content'],
                    order=q_data['options'].index(o_data) + 1,
                    score=o_data['score']
                )
                db.session.add(option)
    
    # 压力感知量表
    if not Questionnaire.query.filter_by(code='PSS').first():
        pss = Questionnaire(
            title='压力感知量表',
            description='压力感知量表(PSS)用于评估个人在生活中感知到的压力水平。',
            code='PSS',
            instruction='请根据过去一个月的情况，选择最符合您感受的选项。',
            estimated_time=4,
            category='专业量表'
        )
        db.session.add(pss)
        db.session.flush()
        
        # 添加问题
        questions = [
            {
                'content': '感到无法控制生活中重要的事情',
                'order': 1,
                'options': [
                    {'content': '从不', 'score': 0},
                    {'content': '偶尔', 'score': 1},
                    {'content': '经常', 'score': 2},
                    {'content': '总是', 'score': 3}
                ]
            },
            {
                'content': '对处理个人问题缺乏信心',
                'order': 2,
                'options': [
                    {'content': '从不', 'score': 0},
                    {'content': '偶尔', 'score': 1},
                    {'content': '经常', 'score': 2},
                    {'content': '总是', 'score': 3}
                ]
            }
        ]
        
        for q_data in questions:
            question = Question(
                questionnaire_id=pss.id,
                content=q_data['content'],
                order=q_data['order'],
                question_type='single_choice'
            )
            db.session.add(question)
            db.session.flush()
            
            # 添加选项
            for o_data in q_data['options']:
                option = Option(
                    question_id=question.id,
                    content=o_data['content'],
                    order=q_data['options'].index(o_data) + 1,
                    score=o_data['score']
                )
                db.session.add(option)
    
    # 人际关系量表
    if not Questionnaire.query.filter_by(code='IRI').first():
        iri = Questionnaire(
            title='人际关系量表',
            description='评估个人在人际交往中的表现和感受。',
            code='IRI',
            instruction='请根据您的日常经历，选择最符合您情况的选项。',
            estimated_time=4,
            category='趣味测试'
        )
        db.session.add(iri)
        db.session.flush()
        
        # 添加问题
        questions = [
            {
                'content': '我容易理解他人的感受',
                'order': 1,
                'options': [
                    {'content': '完全不符合', 'score': 0},
                    {'content': '有点符合', 'score': 1},
                    {'content': '比较符合', 'score': 2},
                    {'content': '非常符合', 'score': 3}
                ]
            },
            {
                'content': '我善于处理人际冲突',
                'order': 2,
                'options': [
                    {'content': '完全不符合', 'score': 0},
                    {'content': '有点符合', 'score': 1},
                    {'content': '比较符合', 'score': 2},
                    {'content': '非常符合', 'score': 3}
                ]
            }
        ]
        
        for q_data in questions:
            question = Question(
                questionnaire_id=iri.id,
                content=q_data['content'],
                order=q_data['order'],
                question_type='single_choice'
            )
            db.session.add(question)
            db.session.flush()
            
            # 添加选项
            for o_data in q_data['options']:
                option = Option(
                    question_id=question.id,
                    content=o_data['content'],
                    order=q_data['options'].index(o_data) + 1,
                    score=o_data['score']
                )
                db.session.add(option)

if __name__ == '__main__':
    init_db() 