# PHAS (Psychological Health Assessment System)
# 心理健康评估系统

## 项目概述

PHAS是一个综合性的心理健康评估系统，旨在提供专业的心理健康评估、分析、咨询和教育服务。本系统通过科学的评估工具和方法，帮助用户了解自身心理状况，并提供相应的支持和指导。

## 系统界面预览

### 主页

![主页界面](static/主页.png)

### 心理评测模块

![心理评测界面](static/心理评测模块.png)

### 在线咨询功能

![在线咨询界面](static/在线咨询页面.png)

### 心理教育平台

![心理教育界面](static/心理教育页面.png)

## 功能模块

系统主要包含以下功能模块：

1. **用户管理** - 用户注册、登录、个人信息管理
2. **心理评估** - 提供多种专业心理测评工具
3. **心理分析** - 基于评估结果进行专业分析
4. **心理咨询** - 在线咨询服务和预约功能
5. **心理健康教育** - 提供心理健康知识和学习资源

## 技术栈

- **后端框架**: Flask
- **数据库**: MySQL
- **ORM**: SQLAlchemy
- **用户认证**: Flask-Login
- **邮件服务**: Flask-Mail
- **数据库迁移**: Flask-Migrate
- **表单处理**: Flask-WTF

## 安装与设置

### 环境要求

- Python 3.8+
- MySQL 5.7+

### 安装步骤

1. 克隆仓库

```bash
git clone https://github.com/yourusername/PHAS.git
cd PHAS
```

2. 创建并激活虚拟环境

```bash
python -m venv PHAS/.venv
source PHAS/.venv/bin/activate  # Linux/Mac
# 或者
# PHAS\.venv\Scripts\activate  # Windows
```

3. 安装依赖

```bash
pip install -r requirements.txt
```

4. 配置数据库

```bash
# 导入初始数据库结构
mysql -u username -p < phas_dev.sql
```

5. 配置环境变量

创建`.env`文件并设置必要的环境变量：

```
FLASK_APP=PHAS
FLASK_ENV=development
DATABASE_URL=mysql+pymysql://username:password@localhost/phas
SECRET_KEY=your_secret_key
```

6. 运行应用

```bash
flask run
```

## 项目结构

```
PHAS/
├── app/                    # 应用程序代码
│   ├── controllers/        # 控制器
│   ├── models/             # 数据模型
│   ├── static/             # 静态资源
│   ├── templates/          # HTML模板
│   └── utils/              # 工具函数
├── config/                 # 配置文件
└── sql/                    # SQL脚本
```

## 开发指南

### 代码风格

项目遵循PEP 8编码规范。请确保在提交代码前运行代码检查工具。

### 分支管理

- `main`: 稳定版本分支
- `develop`: 开发分支
- 功能开发请创建格式为`feature/功能名称`的分支

### 提交说明

提交信息应简明扼要地描述变更内容，格式如下：

```
[模块名] 变更描述
```

## 许可证

[待定]

## 联系方式

如有问题或建议，请联系项目维护者：[联系方式]
