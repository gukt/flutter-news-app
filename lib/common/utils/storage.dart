import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storages {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static dynamic get(String key) {
    return _prefs.get(key);
  }

  static Future<bool> set(String key, dynamic value) async {
    if (value is int) {
      return _prefs.setInt(key, value);
    }
    if (value is int) {
      return _prefs.setInt(key, value);
    }
    if (value is double) {
      return _prefs.setDouble(key, value);
    }
    if (value is String) {
      return _prefs.setString(key, value);
    }
    if (value is List<String>) {
      return _prefs.setStringList(key, value);
    }
    // 其他类型的对象，将其转换为 JSON 字符串保存
    return _prefs.setString(key, jsonEncode(value));
  }
}

// class AppStorage {
//   // A well-known singleton pattern
//   static AppStorage _instance = AppStorage._();
//   factory AppStorage() => _instance;
//   AppStorage._();

//   Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   /// 用户信息
//   static const String userProfile = 'user_profile';

//   /// 上次打开时间
//   static const String lastOpenTime = 'last_open_time';

//   /// 首页新闻缓存 Key
//   static const String cachedHomeNews = 'cached_home_news';

//   static late SharedPreferences _prefs;

//   static init() async {
//     debugPrint('Initializing AppStorage...');
//     SharedPreferences.getInstance();
//   }

//   Future<bool> setObject(String k, dynamic v) {
//     return setString(k, jsonEncode(v));
//   }

//   dynamic getObject(String k) {
//     return jsonDecode(getString(k));
//   }
// }
