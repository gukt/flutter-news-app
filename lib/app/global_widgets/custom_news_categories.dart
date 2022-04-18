import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_news_app/app/modules/news_home/news_home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../core/app_config.dart';

/// 可横向滚动的新闻分类列表组件
class CustomNewsCategoryList extends GetView<NewsHomeController> {
  const CustomNewsCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      child: Obx(
        () {
          return Wrap(
            spacing: 25.w,
            children: controller.categories.map<Widget>((item) {
              return Text(item, style: context.h4).onTap(() {
                toast(' taped.');
              });
            }).toList(),
          );
        },
        // onLoading: const Text('Loading...'),
        // onEmpty: const Text('No data.'),
      ),
    );
    // return controller.obx(
    //   (_) => SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
    //     child: Wrap(
    //       spacing: 25.w,
    //       children: controller.categories.map<Widget>((item) {
    //         return Text(item, style: context.h4).onTap(() {
    //           toast(' taped.');
    //         });
    //       }).toList(),
    //     ),
    //   ),
    //   onEmpty: const Text('No categories'),
    //   onLoading: const Text('Loading...'),
    // );
  }
}
