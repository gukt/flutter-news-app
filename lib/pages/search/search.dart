import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/ui.dart';
import 'package:flutter_news_app/widgets/app_tag.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  _buildSearchBar() {
    return const Text('Search bar');
  }

  // Top channels
  _buildChannels(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context, 'Top channels'),
        buildChannels(context),
      ],
    );
  }

  // Popular tags
  _buildPopularTags(BuildContext context) {
    final tags = [
      'music',
      'today',
      'trump',
      'business',
      'marketing',
      'mbi',
      'rock',
      'sprots',
      'bloomberg'
    ];
    return Column(
      children: <Widget>[
        _buildTitle(context, 'Top channels'),
        AppTagList(tags),
        SizedBox(height: 20.h),
      ],
    );
  }

  _buildTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: <Widget>[
          Text(title, style: context.h4),
          const Spacer(),
          Text('Show All', style: context.linkText),
        ],
      ),
    );
  }

  _buildNewsItem(
    BuildContext context, {
    required String title,
    required String category,
    required String time,
  }) {
    return SizedBox(
      width: 160.w,
      child: Column(
        children: <Widget>[
          // 封面图
          Container(
            color: Colors.amber,
            width: 160.w,
            height: 160.w,
          ),
          SizedBox(height: 16.h),
          // 标题
          Text(title, style: context.h5),
          SizedBox(height: 10.h),
          // 分类，时间
          Row(
            children: <Widget>[
              Text(category, style: context.linkText),
              SizedBox(width: 15.w),
              Text(
                time,
                style: context.bodyText3?.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Hot news
  _buildHotNews(BuildContext context) {
    return Container(
      // TODO 设计值为 20，但这里会换行，看看什么情况
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Wrap(
        spacing: 15.w,
        runSpacing: 20.h,
        children: <Widget>[
          _buildTitle(context, 'Hot news'),
          _buildNewsItem(
            context,
            title: 'How China uses LinkedIn to recruit spies abroad',
            category: 'Politics',
            time: '•   1m ago',
          ),
          _buildNewsItem(
            context,
            title: 'How China uses LinkedIn to recruit spies abroad',
            category: 'Politics',
            time: '•   1m ago',
          ),
          _buildNewsItem(
            context,
            title: 'How China uses LinkedIn to recruit spies abroad',
            category: 'Politics',
            time: '•   1m ago',
          ),
          _buildNewsItem(
            context,
            title: 'How China uses LinkedIn to recruit spies abroad',
            category: 'Politics',
            time: '•   1m ago',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildSearchBar(),
            const Divider(height: 1),
            _buildChannels(context),
            const Divider(height: 1),
            _buildPopularTags(context),
            const Divider(height: 1),
            _buildHotNews(context),
          ],
        ),
      ),
    );
  }
}
