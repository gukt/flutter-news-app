import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/values/messages.dart';
import 'package:get/get.dart';

import '../../core/app_config.dart';
import '../../data/model/user_profile.dart';
import '../../data/providers/remote/user_api.dart';
import '../../routes/app_pages.dart';

class SigninController extends GetxController {
  final nameController = TextEditingController(text: '29283212@qq.com');
  final passwordController = TextEditingController(text: 'aaaaaa');
  final nameFoucsNode = FocusNode();

  /// 注册新用户
  Future<void> handleSignIn() async {
    String name = nameController.value.text;
    String password = passwordController.value.text;
    if (name.length < 5) {
      toast(Messages.errInvalidUsername.tr);
      return;
    }
    if (!name.isEmail) {
      toast(Messages.errInvalidEmail.tr);
      return;
    }
    if (password.length < 6) {
      toast(Messages.errPasswordAtLeast.tr);
      return;
    }
    // EasyLoading.show(status: 'loading...', dismissOnTap: true);
    try {
      UserEntity profile = await UserApi.login(name, password);
      log.d('profile', profile);
      // 保存用户信息
      // App.saveUserProfile(profile);

      // 登陆成功, 跳到 HomePage
      Get.offNamed(AppRoutes.home);
    } on DioError catch (e) {
      toast(e.error['msg']);
    }
  }
}
