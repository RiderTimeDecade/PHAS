# 心理健康辅助系统 (PHAS)

## 项目介绍
心理健康辅助系统是一个基于Flask的Web应用，旨在提供全面的心理健康服务，包括心理测评、在线咨询、心理教育和数据分析功能。

## 功能模块
- 用户模块：用户注册、登录和身份验证
- 心理测评：问卷填写和测评结果分析
- 在线咨询：预约心理咨询并进行视频/文字咨询
- 心理教育：在线课程和互动学习
- 数据分析：生成报告和分析结果查看

## 技术栈
- 后端：Python Flask
- 数据库：MySQL
- 前端：HTML, CSS, JavaScript

## 项目结构
```
PHAS/
├── app/                      # 应用主目录
│   ├── controllers/          # 控制器
│   ├── models/               # 数据模型
│   ├── static/               # 静态资源
│   ├── templates/            # 模板文件
│   └── utils/                # 工具函数
├── config/                   # 配置文件
├── migrations/               # 数据库迁移
└── tests/                    # 测试用例
```

## 安装与运行
1. 安装依赖：`pip install -r requirements.txt`
2. 配置数据库：修改 `config/database.py`
3. 运行应用：`python run.py`
