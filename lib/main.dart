import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/core/theme/app_theme.dart';
import 'app/core/strings.dart';
import 'app/modules/home/home_view.dart';
import 'app/modules/root_binding.dart';

void main() {
  runApp(const NewsApp());
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
          initialRoute: AppPages.INITIAL,
          title: Strings.appTitle,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark1,
          // 当同时设置了 [theme] 和 [darkTheme] 主题时，决定使用哪个主题
          themeMode: ThemeMode.light,
          initialBinding: RootBinding(),
          getPages: AppPages.pages,
          // home: const HomeView(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
