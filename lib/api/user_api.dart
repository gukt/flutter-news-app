import 'package:flutter_news_app/common/models/user_profile.dart';
import 'package:flutter_news_app/common/utils/http.dart';

class UserApi {
  /// 用户登陆
  static Future<UserProfile> login(String name, String password) async {
    var res = await dio.post('/sign-in', data: {
      'name': name,
      'password': password,
    });
    return UserProfile.fromJson(res.data as Map<String, dynamic>);
  }
}
