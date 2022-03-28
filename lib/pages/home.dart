import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/utils/iconfonts.dart';
import 'package:flutter_news_app/pages/bookmark/bookmarks.dart';
import 'package:flutter_news_app/pages/search/search_by_category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'account/account_edit.dart';
import 'news_v2/news_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _elements = [
    ['Home', IconFonts.home, const NewsHomePage()],
    ['Categories', IconFonts.grid, const SearchByCategoryPage()],
    ['Bookmarks', IconFonts.tag, const BookmarkPage()],
    ['Account', IconFonts.me, const AccountEditPage()],
  ];
  int _currentIndex = 3;
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
