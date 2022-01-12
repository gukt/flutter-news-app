import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/utils/iconfonts.dart';
import 'package:flutter_news_app/pages/bookmark/bookmarks.dart';
import 'package:flutter_news_app/pages/category/category.dart';
import 'package:flutter_news_app/pages/news/news_home.dart';
import 'package:flutter_news_app/pages/search/search_by_category.dart';
import 'package:flutter_news_app/pages/user/account.dart';
import 'package:flutter_news_app/pages/user/account_edit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final _elements = [
    ['Home', IconFonts.home, const HomePage()],
    ['Categories', IconFonts.grid, const SearchByCategoryPage()],
    ['Bookmarks', IconFonts.tag, const BookmarkPage()],
    ['Account', IconFonts.me, const AccountEditPage()],
  ];
  int _currentIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // 要线是否组件资源, 最后调用 super.dispose(), 这和初始化时正好相反
    super.dispose();
  }

  void _handlePageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('txtScale: ' + ScreenUtil().scaleText.toString());
    debugPrint('scaleHeight: ' + ScreenUtil().scaleHeight.toString());
    debugPrint('scaleWidth: ' + ScreenUtil().scaleWidth.toString());
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _handlePageChanged,
        children: _elements.map((item) => item[2] as Widget).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _handlePageChanged,
        items: _elements.map((item) {
          return BottomNavigationBarItem(
            label: item[0] as String,
            icon: Icon(item[1] as IconData),
          );
        }).toList(),
      ),
    );
  }
}
