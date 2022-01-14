library ui;

import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_api.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';
import 'package:flutter_news_app/common/models/news_entity.dart';
import 'package:flutter_news_app/widgets/app_news.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';

/// 推荐新闻
Widget buildRecommended(BuildContext context) {
  return FutureBuilder(
    future: NewsApi.getRecommendedNews(),
    builder: (context, AsyncSnapshot<NewsEntity?> snapshot) {
      if (!snapshot.hasData) {
        return const Text('No recommended news');
      }
      return AppNewsItem(snapshot.data!, style: 1);
    },
  );
}

/// 新闻分类
Widget buildCategories() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
    child: FutureBuilder(
      future: NewsApi.getCategories(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (!snapshot.hasData) {
          return const Text('Failed to load categories.');
        }
        return Wrap(
          spacing: 25.w,
          children: snapshot.data!.map<Widget>((item) {
            return Text(item, style: context.h4).onTap(() {
              toast(item);
            });
          }).toList(),
        );
      },
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

// class AppNoData extends StatelessWidget {
//   const AppNoData({Key? key, this.label}) : super(key: key);

//   final String? label;

//   @override
//   Widget build(BuildContext context) {
//     return Text(label ?? 'No data');
//   }
// }
