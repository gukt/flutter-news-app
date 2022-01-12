// import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_news_app/common/config.dart';

// class Https {
//   // static final Https _instance = Https._();
//   // factory Https() => _instance;
//   // static final CancelToken _cancelToken = CancelToken();
//   // static late Dio _dio = _init();

//   // static _init() {
//   //   debugPrint('正在初始化 DIO 实例');
//   //   // 基础的公共配置
//   //   BaseOptions options = BaseOptions(
//   //       baseUrl: baseUrl,
//   //       connectTimeout: connectTimeout,
//   //       receiveTimeout: receiveTimeout,
//   //       contentType: ContentType.json.toString());
//   //   // 使用基础配置实例化一个 DIO 对象
//   //   _dio = Dio(options);
//   //   // 添加 CookieManager 拦截器
//   //   _dio.interceptors.add(CookieManager(CookieJar()));
//   //   // 添加自定义的拦截器
//   //   _dio.interceptors.add(InterceptorsWrapper(
//   //     onError: (e, handler) {
//   //       // Something errors ocurred.
//   //     },
//   //   ));
//   // }

//   static void _showLoading() {}

//   static void _hideLoading() {}

//   static _request(
//     String path, {
//     Map<String, dynamic>? params,
//     Options? options,
//     bool showLoading = true,
//     BuildContext? context,
//   }) async {
//     showLoading ? _showLoading() : _hideLoading();
//     // TODO 接收不同的
//     var response = await _dio.request(
//       path,
//       queryParameters: params,
//       options: options,
//     );
//     return response.data;
//   }

//   get(
//     String path, {
//     Map<String, dynamic>? params,
//     dynamic data,
//     Options? options,
//   }) async {
//     return _request(path, params: params);
//   }
// }

// // https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
// const Map<int, String> _messageByStatusCode = {
//   400: '请求语法错误',
//   401: '没有权限',
//   403: '服务器拒绝执行',
//   404: '地址没找到',
//   405: '请求被禁止',
//   500: '服务器内部错误',
//   502: '无效的请求',
//   503: '服务器完蛋了',
//   505: '不支持 HTTP 请求协议',
// };

// /// 取消一个请求
// ///
// /// NOTE: 同一个 token 可能会关联多个请求
// void cancelRequest(CancelToken token) {
//   token.cancel('canceled');
// }

// _ErrorResult _resolveResponse(DioError err) {
//   // err.response 有可能为 null 的，比如：
//   // 1. 当请求可能不能到达主机时（例如发生了 DNS 错误）
//   // 2. 网络不可达。
//   if (err.response == null) {
//     return _ErrorResult(-1, '网络故障');
//   }
//   try {
//     int statusCode = err.response!.statusCode ?? -1;

//     // 服务器正常响应，接下来需要处理的是业务逻辑错误
//     if (statusCode == 200) {
//       return _ErrorResult(0, '服务器正');
//     }
//     // 根据映射表，查询常见 Http 错误对应的描述信息
//     String? msg = _messageByStatusCode[statusCode];
//     return _ErrorResult(
//         statusCode, msg ?? err.response!.statusMessage ?? '未知 HTTP 错误');
//   } on Exception catch (_) {
//     return _ErrorResult(-1, "未知错误");
//   }
// }

// _ErrorResult resolveErrorEntity(DioError err) {
//   switch (err.type) {
//     case DioErrorType.response:
//       return _resolveResponse(err);
//     case DioErrorType.cancel:
//       return _ErrorResult(-1, '请求已取消');
//     case DioErrorType.connectTimeout:
//       return _ErrorResult(-1, '连接超时');
//     case DioErrorType.sendTimeout:
//       return _ErrorResult(-1, '请求超时');
//     case DioErrorType.receiveTimeout:
//       return _ErrorResult(-1, '响应超时');
//     default:
//       return _ErrorResult(-1, err.message);
//   }
// }

// class _ErrorResult implements Exception {
//   int code;
//   String message;

//   _ErrorResult(this.code, this.message);

//   @override
//   String toString() {
//     return "Exception: code $code, $message";
//   }
// }
