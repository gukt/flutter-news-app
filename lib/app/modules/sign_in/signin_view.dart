import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_news_app/app/core/values/messages.dart';
import 'package:flutter_news_app/app/global_widgets/custom_third_login.dart';
import 'package:flutter_news_app/app/modules/sign_in/signin_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_borders.dart';
import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_input.dart';
import '../../routes/app_pages.dart';

/// 登陆页面
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
        Text(Messages.txtNews.tr),
        SizedBox(height: 49.h)
      ],
    );
  }

  Widget _buildInputForm(BuildContext context) {
    return Column(
      children: [
        // 用户名输入框（邮箱）
        CustomInput(
          hintText: Messages.hintEmail.tr,
          keyboardType: TextInputType.emailAddress,
          controller: controller.nameController,
          focusNode: controller.nameFoucsNode,
        ),
        SizedBox(height: 15.h),
        // 密码输入框
        CustomInput(
          hintText: Messages.hintPassword.tr,
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 15.h),
        // Sign up 和 Sign in 按钮
        Row(
          children: <Widget>[
            CustomTextButton(
              text: Text(Messages.txtSignUp.tr),
              width: 140.w,
              backgroundColor: const Color.fromRGBO(45, 45, 47, 1),
              foregroundColor: Colors.white,
              onTaped: () => Get.offNamed(AppRoutes.signUp),
            ),
            const Spacer(),
            TextButton(
              onPressed: controller.handleSignIn,
              child: Text(Messages.txtSignIn.tr),
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
        Text(Messages.forgotPassword.tr, style: context.linkText),
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
            const CustomThirdLogin(),
            // 底部 Sign Up 按钮，用于点击后跳转到注册页面
            CustomTextButton(
              text: Text(Messages.txtSignUp.tr),
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 54.h),
              onTaped: () {
                Get.toNamed(AppRoutes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
