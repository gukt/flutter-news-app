import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_api.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';
import 'package:flutter_news_app/common/models/news_entity.dart';
import 'package:flutter_news_app/widgets/app_input.dart';
import 'package:flutter_news_app/widgets/app_news_channel.dart';
import 'package:flutter_news_app/widgets/app_news_item.dart';
import 'package:flutter_news_app/widgets/app_section.dart';
import 'package:flutter_news_app/widgets/app_tag.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 10.h),
      child: const AppTextField(
        hintText: 'Search...',
      ),
    );
  }

  // Top channels
  _buildTopChannels(BuildContext context) {
    return Column(
      children: [
        AppSection(
          title: const Text('Top channels'),
          trailing: const Text('Show All').onTap(() {
            toast('Show All taped.');
          }),
        ),
        const AppNewsChannel(),
        const Divider(),
      ],
    );
  }

  // Popular tags
  _buildPopularTags(BuildContext context) {
    return FutureBuilder(
      future: NewsApi.getPopularTags(),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        debugPrint(
            '_buildPopularTags: $snapshot -- ${snapshot.connectionState}');
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   debugPrint('_buildPopularTags: loading...');
        //   sleep(const Duration(seconds: 3));
        //   return const Text('Loading...');
        // }
        return Column(
          children: <Widget>[
            AppSection(
              title: const Text('Popular tags'),
              trailing: const Text('Show All').onTap(() {
                toast('Show all taped.');
              }),
            ),
            snapshot.hasData
                ? AppTagList(snapshot.data!)
                : const Text('No popular tags'),
            SizedBox(height: 20.h),
            const Divider(),
          ],
        );
      },
    );
  }

  // Hot news
  _buildHotNews(BuildContext context) {
    return Column(
      children: [
        const AppSection(
          title: Text('Hot news'),
          trailing: Text('Show All'),
        ),
        FutureBuilder(
          future: NewsApi.getNewsList(),
          builder: (context, AsyncSnapshot<List<NewsEntity>> snapshot) {
            if (!snapshot.hasData) {
              return const Text('No data.');
            }
            return Wrap(
              spacing: 15.w,
              runSpacing: 20.h,
              children: snapshot.data!.map((item) {
                return AppNewsItem(item, style: 1);
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Search bar
            _buildSearchBar(),
            const Divider(height: 1),
            _buildTopChannels(context),
            _buildPopularTags(context),
            _buildHotNews(context),
          ],
        ),
      ),
    );
  }
}
