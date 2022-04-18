import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/values/messages.dart';
import 'custom_button.dart';

class CustomThirdLogin extends StatelessWidget {
  const CustomThirdLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Messages.txtOrThirdLogin.tr, style: context.bodyText2),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomTextButton(
              text: const Text('Twitter'),
              borderColor: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              onTaped: () {},
            ),
            CustomTextButton(
              text: const Text('Google'),
              borderColor: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              onTaped: () {},
            ),
            CustomTextButton(
              text: const Text('Facebook'),
              borderWidth: 1,
              borderColor: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              onTaped: () {},
            ),
          ],
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
