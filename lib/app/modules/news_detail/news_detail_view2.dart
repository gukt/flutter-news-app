import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../global_widgets/custom_tag.dart';

class NewsDetailPage2 extends StatelessWidget {
  const NewsDetailPage2({Key? key}) : super(key: key);

  _buildTitle(String title, String authors) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 14.h),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(title),
              // 作者
              Text(authors),
            ],
          ),
          const Spacer(),
          // Channel cover
          Image.asset(
            'assets/images/channel-fox.png',
            height: 44.w,
            width: 44.w,
          ),
        ],
      ),
    );
  }

  _buildBody() {
    return const Text('News body (这里插入一个 web view, 可暂且省略');
  }

  _buildTags() {
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
    return AppTagList(
      tags,
      inline: true,
      spacing: 10,
      // leadingSpacing: 20.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          iconSize: context.theme.iconTheme.size ?? 28,
        ),
        title: const Text('News view page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildTitle('Fox News', 'By Lia Castro & Mohsen Salehi'),
            _buildBody(),
            SizedBox(height: 18.h),
            _buildTags(),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
