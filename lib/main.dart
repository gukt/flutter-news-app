import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_news_app/app/core/app_initializer.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/app_initializer.dart';
import 'app/core/intl/app_translations.dart';
import 'app/core/theme/app_theme.dart';
import 'app/core/initial_binding.dart';
import 'app/core/utils/exports.dart';

void main() {
  AppInitializer.init().then((_) {
    runApp(const NewsApp());
  });
}

/// 新闻 App
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint('txtScale: ' + ScreenUtil().scaleText.toString());
    // debugPrint('scaleHeight: ' + ScreenUtil().scaleHeight.toString());
    // debugPrint('scaleWidth: ' + ScreenUtil().scaleWidth.toString());

    return ScreenUtilInit(
      // 设计稿中的设备大小，单位：dp
      // NOTE: 要减去顶部系统状态栏和底部区域的高度
      designSize: const Size(375, 812 - 44 - 32),
      builder: () {
        return GetMaterialApp(
          initialRoute: AppRoutes.home,

          initialBinding: InitialBinding(),
          getPages: AppPages.pages,

          // 使用的字典类
          translations: AppTranslations(),
          // 使用的本地语言
          // locale: Get.deviceLocale,
          locale: const Locale('en', 'US'),
          // 出错后的回退语言
          fallbackLocale: const Locale('zh', 'CN'),

          theme: AppTheme.light,
          darkTheme: AppTheme.dark1,
          // 当同时设置了 [theme] 和 [darkTheme] 主题时，决定使用哪个主题
          themeMode: ThemeMode.light,

          title: Messages.appName.tr,
          // home: const HomeView(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
