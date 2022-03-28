import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/ui.dart';
import 'package:flutter_news_app/widgets/app_input.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          elevation: 1,
          shadowColor: const Color.fromRGBO(230, 230, 231, 1),
          title: const Text('Sign up page'),
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
            Text('Sign up', style: context.h3),
            SizedBox(height: 50.h),
            const AppTextField(
              hintText: 'Full name',
            ),
            SizedBox(height: 15.h),
            const AppTextField(
              hintText: 'Email',
            ),
            SizedBox(height: 15.h),
            const AppTextField(
              hintText: 'Password',
            ),
            SizedBox(height: 15.h),
            AppTextButton(
              text: Text('Create an account', style: context.h4),
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
            buildThirdLogin(context),
            SizedBox(height: 20.h),
            AppTextButton(
              text: const Text('I have an account'),
              width: double.infinity,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
