import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../app.dart';

Dio dio = init();
Dio init() {
  // Global options
  final cacheOptions = CacheOptions(
    // A default store is required for interceptor.
    store: MemCacheStore(),
    // Default.
    policy: CachePolicy.request,
    // Optional. Returns a cached response on error but for statuses 401 & 403.
    hitCacheOnErrorExcept: [401, 403],
    // Optional. Overrides any HTTP directive to delete entry past this duration.
    maxStale: const Duration(days: 7),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  var dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  // 添加拦截器
  _addInterceptors(dio);

  // 添加代理支持，方便抓包调试
  if (debugMode && proxyEnabled) {
    _supportsProxy(dio, 'PROXY localhost:8888');
  }
  return dio;
}

/// 添加对代理的支持
void _supportsProxy(Dio dio, String proxy) {
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.findProxy = (uri) {
      // Proxy all requests to localhost:8888
      return proxy;
    };
    // 禁用证书校验。
    // 因为代理工具会提供一个抓包的自签名证书，会导致证书校验通不过
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
}

/// 添加各种拦截器
void _addInterceptors(Dio dio) {
  dio
    // Cookie 管理拦截器
    ..interceptors.add(CookieManager(CookieJar()))
    // 缓存拦截器
    // 文档: https://pub.dev/documentation/dio_cache_interceptor/latest/
    // ..interceptors.add(DioCacheInterceptor(options: cacheOptions))
    ..interceptors.add(ResponseCacheInterceptor())
    // 日志打印拦截器
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90))
    // 自定义的业务拦截器
    ..interceptors.add(MyInterceptor());
}

class MyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path == 'connect-timeout') {
      throw DioError(
        requestOptions: options,
        type: DioErrorType.connectTimeout,
      );
    }
    // if (options.path == 'status-201') {
    //   throw DioError(
    //     requestOptions: options,
    //     response: Response(
    //       requestOptions: options,
    //       statusCode: 201,
    //       data: 'mock data',
    //     ),
    //     type: DioErrorType.response,
    //   );
    // }
    super.onRequest(options, handler);
  }

// Dio 会将 [200, 300) 之间的状态码视为正常响应. 其他的视为发生了错误.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('MyInterceptor.onResponse, $response.async');
    var res = response.data;
    // 判断收到的数据是否为标准的 API 数据格式
    if (!_validateApiDataFormat(res)) {
      throw ApiDataFormatException(res);
    }
    int code = res['code'];
    // 处理成功, 任何非零的 code 都表示业务逻辑上显示响应了一个错误
    if (code == 0) {
      // 丢掉外层的 code 和 msg, 取出 data 项作为返回值
      response.data = res['data'];
      // 继续传递给下一个拦截器
      return handler.next(response);
    } else {
      // 这里抛出的异常将会在 onError 里接收到, 默认类型为 DioErrorType.other
      throw ApiException(code, res['msg']);
    }
  }

  /// 判断数据是否为标准的 API 响应数据格式, 该格式为服务端和客户端事先定义好的.
  ///
  /// Format: `{"code": 0, "data": {...}, "msg"="success"}`
  bool _validateApiDataFormat(dynamic res) {
    if (res == null) return false;
    return res is Map && res.containsKey('code') && res.containsKey('msg');
  }

  /// NOTE: 以下不需要打印很多过程日志, 因为我们使用了日志记录拦截器在做这些事
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('MyInterceptor.onError');
    // 隐藏 Loading
    EasyLoading.dismiss();

    // 401 表示目标资源需要身份身份验证, 发生此错误一般需要客户端定向到登陆页面
    // https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Status/401
    if (err.response?.statusCode == 401) {
      // 重定向到登陆页面
      // App.go(Signinpage());
      return;
    }

    Uri uri = err.requestOptions.uri;
    // 下面开始根据错误的类型进行不同的判断
    switch (err.type) {
      case DioErrorType.connectTimeout:
        toast('连接超时');
        break;
      case DioErrorType.sendTimeout:
        toast('请求超时');
        break;
      case DioErrorType.receiveTimeout:
        toast('响应超时,请稍候再试');
        break;
      case DioErrorType.response:
        // 如果本次请求不能到达主机.
        // 另外, 如果是在浏览器中运行时, 服务端要设置 Access-Control-Allow-Origin
        // 不然这里会收到 XMLHttpRequest error.
        if (err.response == null) {
          toast('网络有点小问题');
        }
        break;
      case DioErrorType.cancel:
        // 仅记录日志, 不做任何其他处理
        log.d('请求已取消: $uri');
        break;
      case DioErrorType.other:
        if (err.error is SocketException) {
          toast('网络有点问题');
          return;
        }
        // 如果发生了数据格式问题,
        if (err.response is ApiDataFormatException) {
          // 其实服务可能挂了,不然应该会返回固定的格式,哪怕是服务器处理出现了异常
          toast('服务器无法响应');
          return;
        }
        // NOTE: ApiException 也会走这个分支, 因交由调用方去处理具体的业务逻辑问题
        break;
      default:
        break;
    }
    // 最后需要将错误重新抛出, 如果吞没错误, 外层将无法感知失败状态
    // 如果不需要运行到这里, 可以提前直接返回, 比如前面的导航到登录页判断
    throw err;
  }
}

/// 取消一个请求
///
/// NOTE: 同一个 token 可以关联多个请求
void cancelRequest(CancelToken token) {
  token.cancel('canceled');
}

class ResponseCacheInterceptor extends Interceptor {
  /// 内存缓存字典，用于保存已请求过地址的响应
  final _cache = <dynamic, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!cacheEnabled) {
      return handler.next(options);
    }
    Uri uri = options.uri;
    bool forceRefresh = options.extra['refresh'] ?? false;
    if (forceRefresh) {
      debugPrint('$uri force refresh, ignore cache!\n');
      return handler.next(options);
    }
    var cached = _cache[uri];
    if (cached != null) {
      debugPrint('Cache hited: $uri \n');
      return handler.resolve(cached);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions options = response.requestOptions;
    bool cacheRequired = !(options.extra['x-no-cache'] ?? true);
    // 如果启用了缓存, 才将结果缓存起来
    if (cacheEnabled) {
      dynamic cacheKey = options.extra['x-cache-key'] ?? options.uri;
      // 将结果缓存到内存
      _cache[cacheKey] = response;
      // 判断是否指定了需要缓存到本地 Storage
      if (options.extra['x-persist-cache'] ?? false) {
        // 缓存到本地 Storage
        // TODO Storages.save()
      }
    }
    super.onResponse(response, handler);
  }
}

class ApiException extends AppException {
  final int code;

  ApiException(this.code, [String? message]) : super(message);

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb.write('ApiException:');
    if (message != null) {
      sb.write(' $message');
    }
    sb.write(', code: $code');
    if (source != null) {
      sb.write(', source: $source');
    }
    return sb.toString();
  }
}

/// API 数据格式异常
class ApiDataFormatException extends ApiException {
  ApiDataFormatException(dynamic message) : super(-1, message);

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb.write('ApiDataFormatException: $message');
    return sb.toString();
  }
}
