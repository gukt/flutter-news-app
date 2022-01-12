library ui;

import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_api.dart';
import 'package:flutter_news_app/common/app_borders.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';

/// 推荐新闻
Widget buildRecommended(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.w),
          child: FadeInImage.assetNetwork(
            image: 'https://placeimg.com/400/300/nature',
            placeholder: 'assets/loading.gif',
            width: 335.w,
            height: 290.h,
            fit: BoxFit.cover,
          ).onTap(() {}),
        ),
        SizedBox(height: 14.h),
        // 新闻作者
        Text('Bloomberg', style: context.subtitle1),
        SizedBox(height: 10.h),
        // 新闻标题
        Text(
          'The green-blue blooms of toxic algae have been found in Prospect Park',
          style: context.h3,
        ).onTap(() {}),
        SizedBox(height: 10.h),
        // 附加信息
        Row(
          children: [
            Text('Health', style: context.linkText).onTap(() {
              toast('Clicked');
            }),
            SizedBox(width: 15.w),
            Text('1 min ago', style: context.subtitle1),
            const Spacer(),
            Icon(Icons.more_horiz, size: 24.sp).onTap(() {}),
          ],
        ),
      ],
    ),
  );
}

/// 新闻分类
Widget buildCategories() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
    child: FutureBuilder(
      future: NewsApi.getCategories(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Wrap(
            spacing: 25.w,
            children: snapshot.data.map<Widget>((item) {
              return Text(item['name'], style: context.h4).onTap(() {
                toast(item['name']);
              });
            }).toList(),
          );
        } else {
          return const Text('Failed to load categories.');
        }
      },
    ),
  );
}

/// 新闻频道列表
Widget buildChannels(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: EdgeInsets.all(20.w),
      child: FutureBuilder(
        future: NewsApi.getChannels(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Wrap(
              spacing: 20.w,
              children: snapshot.data.map<Widget>((item) {
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

Widget buildThirdLogin(BuildContext context) {
  return Column(
    children: [
      Text('Or sign in with social networks', style: context.bodyText2),
      SizedBox(height: 20.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppTextButton(
            const Text('Twitter'),
            borderColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            onPressed: () {},
          ),
          AppTextButton(
            const Text('Google'),
            borderColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            onPressed: () {},
          ),
          AppTextButton(
            const Text('Facebook'),
            borderWidth: 1,
            borderColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            onPressed: () {},
          ),
        ],
      ),
      SizedBox(height: 40.h),
    ],
  );
}
