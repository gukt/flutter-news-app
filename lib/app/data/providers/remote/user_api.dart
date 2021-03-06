import '../../../core/utils/http.dart';
import '../../model/user_profile.dart';

class UserApi {
  /// 用户登陆
  static Future<UserEntity> login(String name, String password) async {
    var res = await dio.post('/sign-in', data: {
      'name': name,
      'password': password,
    });
    return UserEntity.fromJson(res.data as Map<String, dynamic>);
  }
}
