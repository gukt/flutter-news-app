import 'package:flutter/material.dart';

/// 系统相应状态
class AppState with ChangeNotifier {
  bool _useGreyFilter = false;
  bool get useGreyFilter => _useGreyFilter;

  AppState({bool useGreyFilter = false}) {
    _useGreyFilter = useGreyFilter;
  }

  // 切换灰色滤镜
  switchGrayFilter() {
    _useGreyFilter = !_useGreyFilter;
    notifyListeners();
  }
}
