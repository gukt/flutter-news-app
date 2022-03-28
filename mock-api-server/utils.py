from flask.json import jsonify as _jsonify
from flask import request
import math

Pageable = dict

# class Pageable:
#     total_elements = 0
#     page = 0
#     size = 10
#     total_pages = 0

#     def __init__(self, total_elements, page, size) -> None:
#         self.total_elements = total_elements
#         self.page = page
#         self.size = size
#         self.total_pages = math.ceil(total_elements / size)

#     def __init__(self, total_elements, request) -> None:
#         self.total_elements = total_elements
#         self.page = request.args.get('page', 0)
#         self.size = request.args.get('size', 10)
#         self.total_pages = math.ceil(total_elements / self.size)


def resolve_pageable(total_elements, request) -> Pageable:
    # 每页记录个数
    size = int(request.args.get('size', 10))
    # 当前页码
    page = int(request.args.get('page', 0))
    # 总页数
    total_pages = math.ceil(total_elements / size)
    if(page >= total_pages):
        has_next = False
        # raise AttributeError('page: %s, excepted: [0, %s)' % (
        #     page, total_pages))

    has_next = page < total_pages - 1
    if has_next:
        number_of_elements = size
    else:
        number_of_elements = max(0, total_elements - page * size)

    return Pageable(
        total_elements=total_elements,
        page=page,
        size=size,
        total_pages=total_pages,
        number_of_elements=number_of_elements,
        has_next=has_next
    )


def jsonify(*args, **kwargs):
    """Wrap regular api-style response

    Examples:
    ```
    # 返回一个对象
    json(k1=1, k2=2)
    # {"code":0,"data":{"k1":1,"k2":2},"msg":"success"}

    # 返回一个数组
    json(1, 2, 3)
    # {"code":0,"data":[1,2,3],"msg":"success"}

    # 返回一个字符串
    json("Hello world")
    # {"code":0,"data":"Hello world","msg":"success"}

    # 返回一个错误
    json('Invalid password', 1001)
    # {"code": 1001, "msg": "Invalid password"}
    ```
    """
    if args and kwargs:
        raise '不能同时提供 args 和 kwargs'

    # 处理 jsonify(1001, 'error message') 这种特例
    if len(args) == 2:
        if isinstance(args[0], int) and isinstance(args[1], str):
            kwargs['code'] = args[0]
            kwargs['msg'] = args[1]
            return _jsonify(**kwargs)
        if isinstance(args[0], list) and isinstance(args[1], Pageable):
            kwargs = args[1]
            kwargs['content'] = args[0]
            args = tuple()

    if len(args) == 1:
        args = args[0]

    kwargs = {'data': args or kwargs}
    kwargs['msg'] = 'success'
    kwargs['code'] = 0
    return _jsonify(**kwargs)
