import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../data/model/news_entity.dart';
import '../../data/providers/remote/news_api.dart';
import '../../global_widgets/custom_news_channels.dart';
import '../../global_widgets/custom_news_item.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({Key? key}) : super(key: key);

  _buildNewsList() {
    return FutureBuilder(
      future: NewsApi.getNewsList(),
      builder: (context, AsyncSnapshot<List<NewsEntity>> snapshot) {
        if (!snapshot.hasData) {
          return const Text('No data.');
        }
        var _widgets = <Widget>[];
        int _style = 0;
        snapshot.data!.asMap().forEach((index, item) {
          if (index % 3 == 2) {
            _style = 1;
          } else if (index % 3 == 1) {
            _style = 2;
          } else {
            _style = 0;
          }
          _widgets.add(CustomNewsItem(item, style: _style));
        });
        return Column(children: _widgets);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: context.theme.iconTheme.size,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 14.h),
              child: Text('Bookmarks', style: context.h2),
            ),
            const Divider(),
            const CustomNewsChannelList(),
            const Divider(),
            _buildNewsList(),
          ],
        ),
      ),
    );
  }
}
