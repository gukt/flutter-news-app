import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/news_api.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/app_borders.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/extensions.dart';
import 'package:flutter_news_app/common/extensions/time_ext.dart';
import 'package:flutter_news_app/common/models/news_entity.dart';
import 'package:flutter_news_app/common/ui.dart';
import 'package:flutter_news_app/widgets/app_button.dart';
import 'package:flutter_news_app/widgets/app_input.dart';
import 'package:flutter_news_app/widgets/app_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  void _handleRecommendedNewsClicked() {
    toast('cover taped');
  }

  /// 新闻列表项
  Widget _buildNewsListItem(NewsEntity entity) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // 左边封面图
              ClipRRect(
                borderRadius: BorderRadius.circular(6.w),
                child: FadeInImage.assetNetwork(
                  image: entity.thumbnail!,
                  placeholder: 'assets/loading.gif',
                  height: 121.w,
                  width: 121.w,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: const Text(
                        'Whoops!',
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  },
                ),
              ).onTap(_handleRecommendedNewsClicked),
              SizedBox(height: 14.h),
              // 右边的标题，频道，分类，发布时间信息。
              // 占行的剩余宽度
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20.w),
                  height: 121.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 新闻渠道
                      Text(entity.channel, style: context.subtitle1).onTap(() {
                        toast('News channel clicked.');
                      }),
                      // 新闻标题
                      Text(
                        entity.title,
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                        style: context.h4,
                      ).onTap(() {
                        toast('News title clicked.');
                      }),
                      Row(
                        children: <Widget>[
                          // 这里不要用 TextButton, 会撑开位置造成溢出
                          Text(entity.category!, style: context.linkText)
                              .onTap(() {
                            toast('news category clicked.');
                          }),
                          SizedBox(width: 15.w),
                          Text(
                            '•   ${entity.createdAt.agoStyle}',
                            style: context.bodyText3?.copyWith(
                              color: AppColors.secondaryText,
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.more_horiz, size: 24.sp).onTap(() {}),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildNewsList() {
    return FutureBuilder(
      future: NewsApi.getNewsList(0, 10),
      builder:
          (BuildContext context, AsyncSnapshot<List<NewsEntity>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('ConnectionState.none');
          case ConnectionState.waiting:
            return const Text('ConnectionState.waiting');
          default:
            // 异步有异常
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var newsItems = <Widget>[];
              snapshot.data!.asMap().forEach((key, value) {
                newsItems.add(_buildNewsListItem(value));
                // 每一行新闻后面都跟一个分隔符
                newsItems.add(const Divider());
                if (key == 2) {
                  newsItems.add(_buildAd());
                  // 广告后面也要带上一行分隔符
                  newsItems.add(const Divider());
                }
              });
              // newsItems = snapshot.data!.map(_buildNewsListItem).toList();
              return Column(children: newsItems);
            }
        }
      },
    );
  }

  /// 广告
  Widget _buildAd() {
    // 再套一层 Container 是为了让水波纹效果不要扩大到 margin 区域
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      // TODO 用 OutlinedButton
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 26.w),
        decoration: BoxDecoration(
          border: Border.all(color: primaryBorderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          r'Tired of Ads? Get Premium - $9.99',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
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
          AppSimpleTile(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            title: Text('Newsletter', style: context.h4),
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
            Text('Subscrible'),
            width: double.infinity,
            backgroundColor: AppColors.secondarySurface,
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
    // await _buildNewsList();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Welcome'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              toast('Jump to search page.');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 新闻分类
            buildCategories(),
            const Divider(),
            // 推荐新闻
            buildRecommended(context),
            const Divider(),
            // 频道列表
            buildChannels(context),
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
