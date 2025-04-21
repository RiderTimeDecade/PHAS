import os
from dotenv import load_dotenv

# 加载环境变量
load_dotenv()

# 数据库配置
DB_USER = os.environ.get('DB_USER', 'root')
DB_PASSWORD = os.environ.get('DB_PASSWORD', 'mzq123..')
DB_HOST = os.environ.get('DB_HOST', 'localhost')
DB_PORT = os.environ.get('DB_PORT', '3306')
DB_NAME = os.environ.get('DB_NAME', 'phas_dev')

# SQLAlchemy数据库URI
SQLALCHEMY_DATABASE_URI = f'mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'

# 其他数据库配置
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ECHO = True  # 开发环境下打印SQL语句
SQLALCHEMY_POOL_RECYCLE = 280  # 连接回收时间
