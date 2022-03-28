import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_borders.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/pages/news_v2/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppNewsChannel extends StatelessWidget {
  const AppNewsChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: GetX<NewsController>(
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
