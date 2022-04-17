import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_config.dart';
import '../../data/model/user_profile.dart';
import '../../data/providers/remote/user_api.dart';
import '../home/home_view.dart';

class SigninController extends GetxController {
  final nameController = TextEditingController(text: '29283212@qq.com');
  final passwordController = TextEditingController(text: 'aaaaaa');
  final nameFoucsNode = FocusNode();

  Future<void> handleSignIn() async {
    String name = nameController.value.text;
    String password = passwordController.value.text;

    if (name.length < 5) {
      toast('用户名至少 5 位');
      return;
    }
    if (!name.isEmail) {
      toast('邮箱地址不正确');
      return;
    }
    if (password.length < 6) {
      toast('密码至少 6 位');
      return;
    }
    // EasyLoading.show(status: 'loading...', dismissOnTap: true);
    try {
      UserProfile profile = await UserApi.login(name, password);
      log.d('profile', profile);
      // 保存用户信息
      // App.saveUserProfile(profile);
      // 登陆成功, 跳到 HomePage
      Get.to(const HomeView());
    } on DioError catch (e) {
      toast(e.error['msg']);
    }
  }
}
