import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/app_theme_data.dart';
import 'package:flutter_news_app/pages/account/sign_in.dart';
import 'package:flutter_news_app/pages/account/sign_up.dart';
import 'package:flutter_news_app/pages/home.dart';
import 'package:flutter_news_app/pages/news_v2/binding.dart';
import 'package:flutter_news_app/pages/news_v2/news_home.dart';
import 'package:flutter_news_app/pages/root_binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const NewsApp());
}

/// 新闻 App
class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 设计稿中的设备大小，单位：dp
      // NOTE: 要减去顶部系统状态栏和底部区域的高度
      designSize: const Size(375, 812 - 44 - 32),
      builder: () {
        return GetMaterialApp(
          // 指定创建 Navigator 实例时用到的 key,
          // 指定这个 key 的好处是以后可以在任何地方通过这个 key 来执行路由跳转,
          // 比如在封装的网络调用模块中要执行登陆跳转时就会用到
          navigatorKey: App.navKey,
          title: '瓜瓜新闻',
          theme: AppThemeData.light,
          darkTheme: AppThemeData.dark1,
          // 当同时设置了 [theme] 和 [darkTheme] 主题时，决定使用哪个主题
          themeMode: ThemeMode.light,
          // home: const SignInPage(),
          // home: const SearchByCategoryPage(),
          // home: const WelcomePage(),
          initialBinding: RootBinding(),
          getPages: [
            GetPage(
              name: '/news_home',
              page: () => const NewsHomePage(),
              binding: NewsBinding(),
            ),
            GetPage(
              name: '/sign_in',
              page: () => const SignInPage(),
            ),
            GetPage(
              name: '/sign_up',
              page: () => const SignUpPage(),
            ),
          ],
          home: const HomePage(),
          // home: const AccountEditPage(),
          // home: const AccountPage(),
          // home: const SearchPage(),
          // home: const NewsPage2(),
          // home: const SignInPage(),
          // home: const ThemeTestPage(),
          // home: const DemoMiscPage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() => _counter++);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
