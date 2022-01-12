import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_news_app/common/provider.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:logger/logger.dart';
import 'package:package_info/package_info.dart';

import 'models/user_profile.dart';

Logger log = Logger();

const bool debugMode = true;

// === Cache ===

/// 是否启用缓存
const cacheEnabled = false;

/// 缓存最大时间，单位：秒
const cacheMaxAge = 1000;

/// 缓存最大条目数
const cacheMaxCount = 100;

// === Proxy ===

/// 是否启用代理服务
const proxyEnabled = false;

/// 代理服务器主机
const proxyHost = "127.0.0.1";

/// 代理服务器端口
const proxyPort = 8866;

// === 网络请求 ===

/// 连接超时毫秒数
const int connectTimeout = 10000;

const int receiveTimeout = 5000;

// const String baseUrl = "http://127.0.0.1:5000/";
// 真机调试时使用
// const String baseUrl = "http://172.20.10.2:5000/";
const String baseUrl = "http://192.168.1.7:5000/";

/// 应用程序全局类
class App {
  /// 全局应用程序 Key
  static final GlobalKey key = GlobalKey();
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  /// Global application context
  static final BuildContext? context = key.currentContext;

  /// 发行渠道
  static const String distributionChannel = 'xiao mi';

  /// Android 设备信息
  static late final AndroidDeviceInfo androidInfo;

  /// IOS 设备信息
  static late final IosDeviceInfo iosInfo;

  /// Package info
  static late final PackageInfo packageInfo;

  /// 是否是首次打开 App
  static late final bool firstOpen;

  static late final bool offlineLogin;

  static final AppState appState = AppState();

  /// 用户配置信息
  static UserProfile? userProfile;

  /// 是否是 Release 版本
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  /// 初始化应用程序
  static Future<void> init() async {
    // 获取设备相关信息
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
      debugPrint('Running on ${iosInfo.utsname.machine}');
    } else if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      debugPrint('Running on ${androidInfo.model}');
    }

    // 获取包相关信息
    packageInfo = await PackageInfo.fromPlatform();
    debugPrint('Package info: \n'
        '   appName = ${packageInfo.appName}\n'
        '   packageName = ${packageInfo.packageName}\n'
        '   version = ${packageInfo.version}\n'
        '   buildNumber = ${packageInfo.buildNumber}');

    // 初始化本地存储系统
    await Storages.init();

    // 读取上次打开时间，依次判断 App 是否为首次打开
    String? lastOpenTime = Storages.get(Keys.lastOpenTime);
    if (lastOpenTime == null) {
      firstOpen = true;
      // 设定打开时间
      Storages.set(Keys.lastOpenTime, DateTime.now());
    }

    // 读取离线用户信息
    dynamic profileJson = Storages.get(Keys.userProfile);
    if (profileJson != null) {
      userProfile = UserProfile.fromJson(profileJson);
      offlineLogin = true;
    }

    // 设置 Android 状态栏为透明的
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }

  /// 跳转到指定页面
  static void go(Widget route) {
    navKey.currentState!.push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => route,
      ),
    );
  }

  /// 跳转到一个指定名称的页面
  static void goNamed(String routeName) {
    navKey.currentState!.pushNamed(routeName);
  }

  /// 回退到上一个页面
  static void back() {
    navKey.currentState!.pop();
  }

  /// 持久化保存用户信息
  static Future<bool> saveUserProfile(UserProfile profile) {
    userProfile = profile;
    return Storages.set(Keys.userProfile, profile.toJson());
  }
}

void toast(String message) {
  EasyLoading.showToast(message);
}

class Keys {
  /// 用户信息
  static const String userProfile = 'user_profile';

  /// 上次打开时间
  static const String lastOpenTime = 'last_open_time';

  /// 首页新闻缓存 Key
  static const String cachedHomeNews = 'cached_home_news';
}

/// 基本应用程序异常接口
abstract class AppException implements Exception {
  final String? message;
  final dynamic source;

  AppException([this.message = '', this.source]);

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb.write('AppException');
    if (message != null) {
      sb.write(': $message');
    }
    if (source != null) {
      sb.write(', source: $source');
    }
    return sb.toString();
  }
}

// // TODO TBD
// class NetworkException extends AppException {
//   final Uri? uri;

//   NetworkException(this.uri, [String? message]);

//   @override
//   String toString() {
//     StringBuffer sb = StringBuffer();
//     sb.write('NetworkException :');
//     if (message != null) {
//       sb.write(': $message');
//     }
//     if (source != null) {
//       sb.write(', source: $source');
//     }
//     return sb.toString();
//   }
// }
