import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_config.dart';
import '../../core/theme/app_button_styles.dart';
import '../../data/providers/remote/news_api.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  Widget _buildFeatureList() {
    return FutureBuilder(
      future: NewsApi.getFeatures(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (!snapshot.hasData) {
          return const Text('No features data.');
        }
        var widgets = <Widget>[];
        snapshot.data!.asMap().forEach((index, value) {
          widgets.add(Row(
            children: [
              Image.asset(
                'assets/images/feature-${index + 1}.png',
                width: 80.w,
                height: 80.w,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20.w),
              Expanded(child: Text(value, maxLines: 3))
            ],
          ));
        });
        return DefaultTextStyle(
          style: context.bodyText2!,
          child: Wrap(runSpacing: 20.h, children: widgets),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 整体设置整个页面的上下左右间距
        margin: EdgeInsets.fromLTRB(40.w, (65 + 44).h, 40.w, 41.h),
        child: Column(
          children: [
            // 标题
            Text('Features', style: context.h2),
            // SizedBox(height: 14.h),
            // // 子标题
            // SizedBox(
            //   width: 242.w,
            //   height: 70.h,
            //   child: const Text(
            //     'The best of news channels all in one place. Trusted sources and personalized news for you.',
            //   ),
            // ),
            // SizedBox(height: 86.h),
            // 特性列表
            // _buildFeatureList(),
            // 弹性间距
            // const Spacer(),
            // 底部按钮
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 120,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Get Started'),
              style: AppButtonStyles.outlined,
            ),
            SizedBox(height: 20.h),
            OutlinedButton.icon(
              onPressed: () {},
              label: const SizedBox(),
              style: AppButtonStyles.primary,
              icon: const Icon(Icons.search, size: 24),
            ),
            SizedBox(height: 20.h),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Get Started'),
              // style: ButtonStyles.primary,
              icon: const Icon(Icons.search, size: 24),
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                toast('message');
              },
              child: const Text('Get Started'),
              style: AppButtonStyles.primary.fitWidth,
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                toast('message');
              },
              child: const Text('Get Started'),
              style: AppButtonStyles.secondary.fitWidth,
            ),
            TextButton(
              onPressed: () {
                toast('message');
              },
              child: const Text('Get Started'),
              // child: Image.asset('assets/images/icons-google.png'),
            )..defaultStyleOf(context),
            // AppTextButton(
            //   onPressed: () {
            //     App.go(const HomePage());
            //   },
            //   text: Text(
            //     'Get Started',
            //     style: context.h4!.copyWith(color: Colors.white),
            //   ),
            //   width: double.infinity,
            //   backgroundColor: const Color.fromRGBO(41, 103, 255, 1),
            //   // TODO 能否通过颜色自动判断
            //   // foregroundColor: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }
}
