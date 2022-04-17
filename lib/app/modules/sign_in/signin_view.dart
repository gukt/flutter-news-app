import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_news_app/app/modules/sign_in/signin_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/app_config.dart';
import '../../core/theme/app_borders.dart';
import '../../core/ui.dart';
import '../../global_widgets/app_button.dart';
import '../../global_widgets/app_input.dart';
import '../../routes/app_pages.dart';
import '../sign_up/signup_view.dart';

class SignInView extends GetView<SigninController> {
  const SignInView({Key? key}) : super(key: key);

  Widget _buildLogo(BuildContext context) {
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

  Widget _buildInputForm(BuildContext context) {
    return Column(
      children: [
        // 用户名输入框（邮箱）
        AppTextField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: controller.nameController,
          focusNode: controller.nameFoucsNode,
        ),
        SizedBox(height: 15.h),
        // 密码输入框
        AppTextField(
          hintText: 'Password',
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 15.h),
        // Sign up 和 Sign in 按钮
        Row(
          children: <Widget>[
            AppTextButton(
              text: const Text('Sign Up'),
              width: 140.w,
              backgroundColor: const Color.fromRGBO(45, 45, 47, 1),
              foregroundColor: Colors.white,
              onPressed: () {
                Get.to(const SignUpView());
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: controller.handleSignIn,
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
            _buildLogo(context),
            // 表单区
            _buildInputForm(context),
            // 自适应填充剩余高度
            const Spacer(),
            // 第三方登陆区
            buildThirdLogin(context),
            // 底部 Sign Up 按钮，用于点击后跳转到注册页面
            AppTextButton(
              text: const Text('Sign Up'),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 54.h),
              onPressed: () {
                toast('将要跳转到 Sign Up 页面');
                Get.toNamed(AppRoutes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
