import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/iconfonts.dart';
import '../account/account_view.dart';
import '../account_edit/account_edit_view.dart';
import '../bookmark/bookmark_view.dart';
import '../news_home/news_home_view.dart';
import '../search_by_category/search_by_category_view.dart';

class HomeController extends GetxController {
  /// PageView 对应的四个页面
  final pages = List<Widget>.unmodifiable([
    const NewsHomePage(),
    const SearchByCategoryView(),
    const BookmarkView(),
    const AccountView(),
  ]);

  // 底部导航栏对应的四个导航项
  final navItems = List<BottomNavigationBarItem>.unmodifiable(const [
    BottomNavigationBarItem(label: 'Home', icon: Icon(IconFonts.home)),
    BottomNavigationBarItem(label: 'Categories', icon: Icon(IconFonts.grid)),
    BottomNavigationBarItem(label: 'Bookmarks', icon: Icon(IconFonts.tag)),
    BottomNavigationBarItem(label: 'Account', icon: Icon(IconFonts.me)),
  ]);

  var pageIndex = 2.obs;
  var pageController = PageController().obs;

  void handlePageChanged(int index) {
    pageIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController.value = PageController(initialPage: pageIndex.value);
  }

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }
}
