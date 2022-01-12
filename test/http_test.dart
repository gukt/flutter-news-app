import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/models/login_req.dart';
import 'package:flutter_news_app/common/utils/http.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('测试连接超时', () async {
    try {
      await dio.post('connect-timeout');
    } on DioError catch (e) {
      log.e('error:', e);
    }
  });

  test('测试 status-code', () async {
    try {
      await dio.get('299');
    } on DioError catch (e) {
      log.e('error:', e);
    }
  });
  test('/sign-in', () async {
    try {
      var res = await dio.post('sign-in', data: {
        'name': 'gukt',
        'password': '1234+aaaa1',
      });
    } on DioError catch (e) {
      log.e('error:', e.error);
    }
  });

  test('/notfound', () async {
    try {
      var res = await dio.post('not-found');
    } on DioError catch (e) {
      log.e('error:', e);
    }
  });

  test('/aaaaa', () {
    // Future future = dio.post('sign-in', data: {
    //   'name': 'gukt',
    //   'password': '1234+aaaa',
    // }).then((value) {
    //   log.i('res:', value);
    // }).onError((error, stackTrace) {
    //   log.e('onErrorxxx: ', error);
    // });

    Future future = dio.post('sign-in', data: {
      'name': 'gukt',
      'password': '1234+aaaa',
    });
    expect(future, completion((value) {
      log.i('res:', value);
    }));
  });

  test('this is my test', () {
    debugPrint('hello');
  });

  test('xxx', () {
    debugPrint(ContentType.json.toString());
  });

  test('test json', () {
    var req = LoginRequest(name: 'gukt', password: 'aaa');
    debugPrint('${req.toJson()}');
  });

  test('Test http get', () async {
    var dio = Dio();
    var res = await dio.get('http://httpbin.org/get');
    res.headers.hashCode;
    res.headers.isEmpty;
    res.headers.add('foo', 'bar');
    var headers = res.headers;
    headers.add('foo', 'baz');

    //  字段属性图标是 小扳手
    var uri = res.realUri;
    uri.authority;
    uri.data;
    uri.fragment;
    uri.hasAbsolutePath;

    res.runtimeType;
    res.hashCode;

    // getter 图标是正方体
    res.data;
    res.statusCode;
    res.headers;
    res.isRedirect;
    res.redirects;
    res.requestOptions;
    res.statusCode;
    res.statusMessage;

// 方法图标是 fx
    res.toString();

    expect(res.statusCode, 200);
    debugPrint('res.data: $res');
    debugPrint('$res');
  });
}
