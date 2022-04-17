import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/app_config.dart';
import '../../core/theme/app_borders.dart';
import '../../core/theme/app_colors.dart';
import '../../core/ui.dart';
import '../../global_widgets/app_button.dart';
import '../../global_widgets/app_input.dart';
import '../../global_widgets/app_news_channel.dart';
import '../../global_widgets/app_news_item.dart';
import '../../global_widgets/app_section.dart';
import 'news_home_controller.dart';

class NewsHomePage extends GetView<NewsHomeController> {
  const NewsHomePage({Key? key}) : super(key: key);

  _buildNewsList() {
    return GetX<NewsHomeController>(
      builder: (controller) {
        if (controller.newsItems.isEmpty) {
          return const Text('Faild to load news.');
        }
        var widgets = <Widget>[];
        // 调用 asMap() 以便能渠道 index
        controller.newsItems.asMap().forEach((index, value) {
          widgets.add(AppNewsItem(value));
          if (index == 2) {
            widgets
              // 第三条新闻追加一条广告
              ..add(_buildAd())
              // 广告下面带分隔符
              ..add(const Divider());
          }
        });
        return Column(children: widgets);
      },
    );
  }

  /// 广告
  Widget _buildAd() {
    // 再套一层 Container 是为了让水波纹效果不要扩大到 margin 区域
    // 用两个 container 组合, 比起使用 OutlinedButton 还相对方便一些
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 26.w),
        decoration: BoxDecoration(
          border: Border.all(color: primaryBorderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(r'Tired of Ads? Get Premium - $9.99'),
      ).onTap(() {
        toast('你点了广告');
      }),
    );
  }

  /// 邮件订阅
  Widget _buildSubscrible(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 25.h),
      child: Column(
        children: [
          AppSection(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            title: const Text('Newsletter'),
            trailing: const Icon(
              Icons.close,
              color: AppColors.secondaryText,
            ),
          ),
          // 订阅邮箱输入框
          const AppTextField(
            hintText: 'Email',
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 15.h),
          // Subscrible 按钮
          const AppTextButton(
            text: Text('Subscrible'),
            width: double.infinity,
            backgroundColor: AppColors.primarySurface,
            foregroundColor: Colors.white,
          ),
          SizedBox(height: 29.h),
          // 底部文本
          SizedBox(
            width: 261.w,
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'By clicking on Subscribe button you agree to accept ',
                    style: context.subtitle1,
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: context.linkText,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        toast('Privacy Policy Clicked');
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Welcome'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              toast('Jump to search page.');
            },
            icon: const Icon(Icons.search),
            iconSize: context.theme.iconTheme.size!,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 新闻分类
            buildCategories(context),
            const Divider(),
            // 推荐新闻
            buildRecommended(context),
            const Divider(),
            // 频道列表
            const AppNewsChannel(),
            const Divider(),
            // 新闻列表
            _buildNewsList(),
            // 邮件订阅
            _buildSubscrible(context),
          ],
        ),
      ),
    );
  }
}
