import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/app_theme_data.dart';
import 'package:flutter_news_app/pages/app_home.dart';
import 'package:flutter_news_app/pages/bookmark/bookmarks.dart';
import 'package:flutter_news_app/pages/search/search_by_category.dart';
import 'package:flutter_news_app/pages/user/account.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return MaterialApp(
          // 指定创建 Navigator 实例时用到的 key,
          // 指定这个 key 的好处是以后可以在任何地方通过这个 key 来执行路由跳转,
          // 比如在封装的网络调用模块中要执行登陆跳转时就会用到
          navigatorKey: App.navKey,
          title: '瓜瓜新闻',
          // 设置 App 的主题，这里我们设置一个自定义的明亮主题。
          // NOTE: 如果没有设置主题，Flutter 将会使用预设的主题
          // theme: ThemeData(
          //   brightness: Brightness.light,
          //   appBarTheme: const AppBarTheme(
          //     backgroundColor: Colors.white,
          //     actionsIconTheme: IconThemeData(
          //       color: AppThemeData.primaryText,
          //     ),
          //   ),
          //   navigationBarTheme: const NavigationBarThemeData(
          //     backgroundColor: Colors.amber,
          //   ),

          //   // textTheme: TextTheme(
          //   //   button: TextStyle(
          //   //     color: AppColors.primaryText,
          //   //   ),
          //   // ),
          //   outlinedButtonTheme: const OutlinedButtonThemeData(),
          //   elevatedButtonTheme: const ElevatedButtonThemeData(),
          //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(),

          //   // buttonTheme: ButtonThemeData(
          //   //   shape: OutlinedBorder(),
          //   // ),
          //   // primaryColor: Colors.blue,
          //   // 文本输入框装饰样式
          //   inputDecorationTheme: InputDecorationTheme(
          //     filled: true,
          //     fillColor: AppThemeData.primarySurface,
          //     border: OutlineInputBorder(
          //       // 因为没有边框线, 所以这里设置为 none
          //       borderSide: BorderSide.none,
          //       // 设置边框为圆角
          //       borderRadius: BorderRadius.circular(6),
          //     ),
          //   ),
          //   colorScheme: const ColorScheme.light(
          //     // 影响 AppBar, Navbar, Tool bar 的背景颜色
          //     // 蓝色
          //     primary: Color.fromRGBO(41, 103, 255, 1),
          //     onPrimary: Colors.white,
          //     primaryVariant: Color.fromRGBO(41, 103, 255, 0.75),

          //     secondary: Colors.green,
          //     secondaryVariant: Colors.red,
          //     onSecondary: Colors.white,

          //     background: Colors.red,
          //     onBackground: Colors.blue,
          //     error: Colors.red,
          //     onError: Colors.red,
          //     surface: Colors.red,
          //     onSurface: AppThemeData.primaryText,
          //   ),
          //   textButtonTheme: const TextButtonThemeData(
          //     style: ButtonStyle(),
          //   ),
          // ),
          // // 同时再设置暗黑主题, 因为同时设置了两个主题, 所以后面需要设置 themeMode 到底使用哪个主题
          // darkTheme: ThemeData(
          //   brightness: Brightness.dark,
          //   // primaryColor: Colors.amber,
          //   // primaryColorDark: Colors.amberAccent,
          //   scaffoldBackgroundColor: Colors.black45,
          //   // backgroundColor: Colors.black87,
          //   colorScheme: const ColorScheme.highContrastDark(),
          // ),
          theme: AppThemeData.light,
          darkTheme: AppThemeData.dark1,
          // 当同时设置了 [theme] 和 [darkTheme] 主题时，决定使用哪个主题
          themeMode: ThemeMode.light,
          // home: const SignInPage(),
          // home: const SearchByCategoryPage(),
          home: const AppHomePage(),
          // home: const AccountPage(),
          // home: const SearchPage(),
          // home: const NewsPage2(),
          // home: const SignInPage(),
          // home: const ThemeTestPage(),
          // home: const DemoMiscPage(),
          // TODO 这是做什么的?
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
