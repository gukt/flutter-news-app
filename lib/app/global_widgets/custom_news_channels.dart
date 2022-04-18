import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/theme/app_borders.dart';
import '../modules/news_home/news_home_controller.dart';

class CustomNewsChannelList extends StatelessWidget {
  const CustomNewsChannelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: GetX<NewsHomeController>(
          builder: (controller) {
            if (controller.channels.isNotEmpty) {
              return Wrap(
                spacing: 20.w,
                children: controller.channels.map<Widget>((item) {
                  return Column(
                    children: [
                      // 外层的阴影框效果
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [primaryShadow],
                        ),
                        child:
                            Image.asset('assets/images/channel-${item[1]}.png'),
                      ),
                      SizedBox(height: 14.h),
                      Text(item[0], style: context.subtitle1)
                    ],
                  );
                }).toList(),
              );
            } else {
              return const Text('Failed to load channels');
            }
          },
        ),
      ),
    );
  }
}
