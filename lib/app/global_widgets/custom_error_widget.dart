import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/strings.dart';

/// 自定义错误页面
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message ?? Strings.whoops,
          style: Get.textTheme.headline5,
        ),
      ),
    );
  }
}
