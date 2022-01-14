import re
from flask import Flask
from flask import request
from faker import Faker
from utils import jsonify, resolve_pageable
import random
from flask_cors import CORS

app = Flask(__name__)

# 设置对跨域请求的支持, 这是最粗暴的方式, 支持所有域名所有路由的跨域请求
# https://flask-cors.readthedocs.io/en/latest/
CORS(app)

#  设置本地为中文
fake_cn = Faker(['zh-CN'])
fake = Faker()

# 新闻分类
categories = [ "Latest", "World", "Business", "Sports", "Life", "Education" ]
# 新闻频道
channels = [
    ['Fox News', 'fox'],
    ['RT News', 'rt'],
    ['NBC News', 'nbc'],
    ['BBC News', 'bbc'],
    ['Bloomberg', 'bloomberg'],
];

@app.route("/")
def index():
    return 'It works.'

@app.get('/<int:status_code>')
def status_code(status_code):
    return 'created', status_code


@app.post('/sign-in')
def sign_in():
    """登陆"""
    # 获取用户名和密码
    name = request.json['name']
    password = request.json['password']
    # 用户名和密码正确的情况
    if name == '29283212@qq.com' and password == 'aaaaaa':
        return jsonify(
            # 鉴权 token
            token=fake.sha256(),
            # 昵称
            nick=fake.first_name(),
            # 头像
            avatar=fake.image_url(100, 100),
            # Twitter 账号名
            twitter=fake.first_name().lower(),
            # 邮箱
            email=fake.ascii_email(),
            # 已收藏新闻个数
            bookmarkNum=fake.random_digit(),
            # 消息个数
            mailNum=fake.random_digit(),
            # 会员计划 ID
            memberPlan=1,
            # 会员过期时间
            memberExpiredAt='2024-12-09 12:00:00',
            # 关注的 channels
            channels=random.choices(channels, k=4),
            createdAt='2021-12-09 12:00:00',
        )
    # 返回用户名和密码不匹配的错误
    return jsonify(1001, 'Invalid username or password')


@app.post('/sign-up')
def sign_up():
    """注册"""
    return jsonify(1001, 'Not implemented')


@app.post('/sign-out')
def sign_out():
    """登出"""
    return jsonify(1002, 'Please sign in first')

def _gen_news(num):
    news = []
    for i in range(num):
        # 这是用于定义生成不同尺寸封面图的
        img_width = 150
        img_height = 150
        if i % 3 == 2:
            img_width = 500
            img_height = 300
        news.append(dict(
            id=i+1,
            title=fake.text(200),
            # TODO format
            # 生成过去的一个时间
            # createdAt=fake.date_time(),
            createdAt='2022-01-13 12:00:00',
            # 随机获取一个分类
            category=random.choice(categories),
            # 速记获取一个频道
            channel=random.choice(channels)[0],
            # 生成图片地址(真实可访问),并指定宽高
            thumbnail=fake.image_url(img_width, img_height),
            author=fake.name(),
            url=fake.url()
        ))
    return news

@app.get('/news')
def get_news():
    """获取新闻列表"""
    pageable = resolve_pageable(25, request)
    num = pageable.get('number_of_elements', 0)
    return jsonify(_gen_news(num), pageable)

@app.get('/recommended-news')
def get_recommended_news():
    """获取推荐新闻"""
    return jsonify(_gen_news(1)[0]);

@app.get('/news/<int:news_id>/comments')
def get_comments(news_id):
    """获取指定新闻的评论列表"""
    pageable = resolve_pageable(25, request)
    coments = []
    for i in range(pageable.get('number_of_elements', 0)):
        coments.append(dict(
            id=i+1,
            content=fake.text(100),
            createdAt=fake.unix_time(),
            nick=fake.name(),
            avatar=fake.image_url(
                placeholder_url='https://placeimg.com/100/100/any')
        ))
    return jsonify(coments, pageable)


@app.get('/news/{id}')
def get_new_by_id(id):
    """根据 ID 获取新闻信息"""
    pass


@app.get('/categories')
def get_categories():
    """获取所有的新闻分类"""
    return jsonify(categories);
    # result = []
    # for index, value in enumerate(categories):
    #     result.append({
    #         'id': index + 1,
    #         'name': value,
    #     })
    # return jsonify(result)

@app.get('/channels')
def get_channels():
    """获取所有的新闻频道列表"""
    return jsonify(channels)


@app.get('/popular-tags')
def get_popular_tags():
    """获取新闻标签"""
    # return jsonify(fake.words(10))
    return jsonify(['music', 'today', 'trump', 'business', 'marketing', 'mbi', 'rock', 'sprots', 'bloomberg'])


@app.get('/channels/{id}')
def get_channel_by_id(id):
    """根据 ID 获取频道信息"""
    pass


@app.get('/countries')
def get_countries():
    """获取国家列表"""
    return jsonify([fake.country() for _ in range(30)]);
        


@app.get('/cities')
def get_cities():
    """获取城市列表"""
    return jsonify([fake.city() for _ in range(30)]);

@app.get('/bookmarks')
def get_bookmarks():
    """获取收藏的新闻列表"""
    pageable = resolve_pageable(386, request)
    num = pageable.get('number_of_elements', 0)
    return jsonify(_gen_news(num), pageable)