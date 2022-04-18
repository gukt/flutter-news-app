import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_news_app/app/core/values/messages.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_input.dart';
import '../../global_widgets/custom_third_login.dart';
import 'signup_controller.dart';

/// 注册页面
class SignUpView extends GetView<SignupController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          elevation: 1,
          shadowColor: const Color.fromRGBO(230, 230, 231, 1),
          title: Text(Messages.txtSignUp.tr),
          // shadowColor: Colors.red,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
            ),
          ]),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, (20 + 34).h),
        child: Column(
          children: [
            // const Divider(),
            Text(Messages.txtSignUp.tr, style: context.h3),
            SizedBox(height: 50.h),
            CustomInput(
              hintText: Messages.hintFullName.tr,
            ),
            SizedBox(height: 15.h),
            CustomInput(
              hintText: Messages.hintEmail.tr,
            ),
            SizedBox(height: 15.h),
            CustomInput(
              hintText: Messages.hintPassword.tr,
            ),
            SizedBox(height: 15.h),
            CustomTextButton(
              text: Text(Messages.txtCreateAccount.tr, style: context.h4),
              backgroundColor: AppColors.primarySurface,
              foregroundColor: Colors.white,
              width: double.infinity,
            ),
            SizedBox(height: 20.h),
            Text.rich(TextSpan(children: [
              const TextSpan(text: 'By signing up you agree to our '),
              TextSpan(text: 'Terms', style: context.linkText),
              const TextSpan(text: ' and '),
              TextSpan(text: 'Conditions of Use', style: context.linkText),
            ])),
            const Spacer(),
            const CustomThirdLogin(),
            SizedBox(height: 20.h),
            CustomTextButton(
              text: Text(Messages.txtHaveAccount.tr),
              width: double.infinity,
              onTaped: () => Get.offNamed(AppRoutes.signIn),
            )
          ],
        ),
      ),
    );
  }
}
