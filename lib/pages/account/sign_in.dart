import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/user_api.dart';
import 'package:flutter_news_app/common/app_borders.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/string_ext.dart';
import 'package:flutter_news_app/common/models/user_profile.dart';
import 'package:flutter_news_app/common/ui.dart';
import 'package:flutter_news_app/pages/account/sign_up.dart';
import 'package:flutter_news_app/home.dart';
import 'package:flutter_news_app/widgets/app_input.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _nameController = TextEditingController(text: '29283212@qq.com');
  final _passwordController = TextEditingController(text: 'aaaaaa');
  final _nameFoucsNode = FocusNode();

  Future<void> _handleSignIn() async {
    String name = _nameController.value.text;
    String password = _passwordController.value.text;

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
      App.saveUserProfile(profile);
      // 登陆成功后, 跳转到 AppHomePage
      App.go(const HomePage());
    } on DioError catch (e) {
      toast(e.error['msg']);
    }
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Container(
          width: 76.w,
          height: 76.w,
          margin: EdgeInsets.only(top: (44 + 40).h, bottom: 20.h),
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [primaryShadow],
          ),
          child: Image.asset(
            'assets/images/logo.png',
            width: 36.w,
            height: 48.h,
          ),
        ),
        Text('SECTOR', style: context.h3),
        const Text('news'),
        SizedBox(height: 49.h)
      ],
    );
  }

  Widget _buildInputForm() {
    return Column(
      children: [
        // 用户名输入框（邮箱）
        AppTextField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: _nameController,
          focusNode: _nameFoucsNode,
        ),
        SizedBox(height: 15.h),
        // 密码输入框
        AppTextField(
          hintText: 'Password',
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 15.h),
        // Sign up 和 Sign in 按钮
        Row(
          children: <Widget>[
            AppTextButton(
              const Text('Sign Up'),
              width: 140.w,
              backgroundColor: const Color.fromRGBO(45, 45, 47, 1),
              foregroundColor: Colors.white,
              onPressed: () {
                // TODO 要传一下这里已经填写过的数据
                // App.go(const SignUpPage());
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const SignUpPage(),
                  ),
                );
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: _handleSignIn,
              child: const Text('Sign In'),
            ),
            // AppTextButton(
            //   const Text('Sign In'),
            //   width: 140.w,
            //   backgroundColor: const Color.fromRGBO(41, 103, 255, 1),
            //   foregroundColor: Colors.white,
            //   onPressed: _handleSignIn,
            // ),
          ],
        ),
        SizedBox(height: 20.h),
        // 忘记密码
        Text('Forgot password?', style: context.linkText),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        // margin: EdgeInsets.symmetric(horizontal: 18.0),
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: <Widget>[
            // 顶部间隔
            const SizedBox(height: 30),
            // 图标区
            _buildLogo(),
            // 表单区
            _buildInputForm(),
            // 自适应填充剩余高度
            const Spacer(),
            // 第三方登陆区
            buildThirdLogin(context),
            // 底部 Sign Up 按钮，用于点击后跳转到注册页面
            AppTextButton(
              const Text('Sign Up'),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 54.h),
              onPressed: () {
                // toast('将要跳转到 Sign Up 页面');
                App.go(const SignUpPage());
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       toast('i am a floating button');
      //     },
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
