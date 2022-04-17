library ui;

import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../global_widgets/app_button.dart';
import '../global_widgets/app_news_item.dart';
import '../modules/news_home/news_home_controller.dart';
import 'app_config.dart';

// /// 推荐新闻
// /// @Deprecated('')
// Widget buildRecommended(BuildContext context) {
//   return FutureBuilder(
//     future: NewsApi.getRecommendedNews(),
//     builder: (context, AsyncSnapshot<NewsEntity?> snapshot) {
//       if (!snapshot.hasData) {
//         return const Text('No recommended news');
//       }
//       return AppNewsItem(snapshot.data!, style: 1);
//     },
//   );
// }

/// 推荐新闻
Widget buildRecommended(BuildContext context) {
  return GetX<NewsHomeController>(
    builder: (controller) {
      if (controller.recommendedNews.value == null) {
        return const Text('No recommended news');
      }
      return AppNewsItem(controller.recommendedNews.value!, style: 1);
    },
  );
}

// /// 新闻分类
// @Deprecated('')
// Widget buildCategories() {
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
//     child: FutureBuilder(
//       future: NewsApi.getCategories(),
//       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//         if (!snapshot.hasData) {
//           return const Text('Failed to load categories.');
//         }
//         return Wrap(
//           spacing: 25.w,
//           children: snapshot.data!.map<Widget>((item) {
//             return Text(item, style: context.h4).onTap(() {
//               toast(item);
//             });
//           }).toList(),
//         );
//       },
//     ),
//   );
// }

buildCategories(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
    child: GetX<NewsHomeController>(
      builder: (controller) {
        debugPrint('Categories updated: ${controller.categories.length}');
        if (controller.categories.isEmpty) {
          return const Text('Failed to load categories.');
        }
        return Wrap(
          spacing: 25.w,
          children: controller.categories.map<Widget>((item) {
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
            text: const Text('Twitter'),
            borderColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            onPressed: () {},
          ),
          AppTextButton(
            text: const Text('Google'),
            borderColor: Colors.grey[200],
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            onPressed: () {},
          ),
          AppTextButton(
            text: const Text('Facebook'),
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
