import os
import sys

# 添加项目根目录到Python路径
sys.path.append(os.path.abspath(os.path.dirname(__file__)))

# 尝试直接导入
try:
    from PHAS.app import create_app
    from PHAS.app.models.education.chapter_model import Chapter
    from PHAS.app import db
except ImportError:
    # 如果无法导入，尝试其他路径
    from app import create_app
    from app.models.education.chapter_model import Chapter
    from app import db

def update_videos():
    """更新所有章节视频为默认视频"""
    # 创建应用上下文
    app = create_app()
    
    with app.app_context():
        try:
            # 获取所有章节
            chapters = Chapter.query.all()
            
            # 更新所有章节的视频URL
            update_count = 0
            for chapter in chapters:
                chapter.video_url = '/static/video/1.mp4'
                update_count += 1
            
            # 提交更改
            db.session.commit()
            
            print(f'成功更新 {update_count} 个章节的视频为默认视频')
        except Exception as e:
            print(f"更新视频时出错: {e}")

if __name__ == '__main__':
    update_videos() 