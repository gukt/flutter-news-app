import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/app/core/utils/exports.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../data/model/user_profile.dart';
import '../global_widgets/custom_error_widget.dart';

/// App 初始化器
abstract class AppInitializer {
  static Future<void> init() async {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      printPlatformInfo();
      printPackageInfo();
      setTransparentStatusBarIfAndroid();

      WidgetsFlutterBinding.ensureInitialized();
      // http://laomengit.com/flutter/widgets/ErrorWidget.html#errorwidget
      // https://blog.csdn.net/chzphoenix/article/details/120974538
      //
      // Flutter 运行期间发生的错误，都会交给这个 onError 处理程序处理，
      // 包括构建期间、布局期间以及绘制期间。
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };
      await _initStorage();
      _initScreenPreference();
      _tryLoadSavedUserInfo();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  /// 初始化屏幕偏好设置
  static void _initScreenPreference() {
    // 确保 WidgetsFlutterBinding 已被实例化，不加这个强制横/竖屏会报错。
    // runApp 内部也是最先调用此方法，由于该 init 方法可能先于 runApp 方法执行，
    // 所以这里也要确保 WidgetsFlutterBinding 实例已经初始化。
    WidgetsFlutterBinding.ensureInitialized();

    // 强制竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // // 强制横屏
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
  }

  /// 初始化 Storage
  static Future<bool> _initStorage() async {
    return await GetStorage.init();
  }

  // 获取并打印平台信息
  static Future<void> printPlatformInfo() async {
    // 获取设备相关信息
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      debugPrint('Running on ${iosInfo.utsname.machine}');
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      debugPrint('Running on ${androidInfo.model}');
    }
  }

  /// 获取包相关信息
  static Future<void> printPackageInfo() async {
    // 获取包相关信息
    final packageInfo = await PackageInfo.fromPlatform();
    debugPrint('Package info: \n'
        '   appName = ${packageInfo.appName}\n'
        '   packageName = ${packageInfo.packageName}\n'
        '   version = ${packageInfo.version}\n'
        '   buildNumber = ${packageInfo.buildNumber}');
  }

  /// 如果是 Android 系统，设置状态栏为透明的
  static void setTransparentStatusBarIfAndroid() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
    }
  }

  /// 尝试读取离线用户信息
  static _tryLoadSavedUserInfo() {
    Map<String, dynamic>? userInfo = GetStorage().read(Keys.userInfo);
    if (userInfo != null) {
      var entity = UserEntity.fromJson(userInfo);
      // 将这个 User 对象永久缓存在内存
      Get.put(entity, permanent: true);
    }
  }

  /// 处理一些常规的业务逻辑
  static void handleBiz() {
    String? lastOpenTime = GetStorage().read(Keys.lastOpenTime);
    App.firstOpen = lastOpenTime == null;
    App.openTime = DateTime.now();
  }
}

class App {
  static bool firstOpen = true;
  static DateTime? lastOpenTime;
  static late DateTime openTime;

  /// Android 设备信息
  static late final AndroidDeviceInfo androidInfo;

  /// IOS 设备信息
  static late final IosDeviceInfo iosInfo;

  /// Package info
  static late final PackageInfo packageInfo;

  /// 是否是 Release 版本
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");
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
