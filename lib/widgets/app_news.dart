import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/index.dart';
import 'package:flutter_news_app/common/app.dart';
import 'package:flutter_news_app/common/app_borders.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/time_ext.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';
import 'package:flutter_news_app/common/models/news_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNewsChannel extends StatelessWidget {
  const AppNewsChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

/// 新闻列表项
///
/// 参数:
/// * [style] 表示排列风格
class AppNewsItem extends StatelessWidget {
  const AppNewsItem(
    this.data, {
    Key? key,
    this.style = 0,
  }) : super(key: key);

  final NewsEntity data;

  /// 排列风格
  /// * 0 - 左右风格 (默认)
  /// * 1 - 上下风格
  /// * 2 - 无图风格
  /// * 3 - 强调风格 用于顶部推荐
  final int style;

  /// 构建封面图
  Widget _buildCover({double? width, double? height}) {
    // 没有封面图返回一个空盒子占位符
    if (data.thumbnail == null) return const SizedBox.shrink();
    // 裁成圆角
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.w),
      child: FadeInImage.assetNetwork(
        image: data.thumbnail!,
        // TODO 这里会把 loading 拉的很大,要怎么搞?
        placeholder: 'assets/loading.gif',
        height: height ?? 121.w,
        width: width ?? 121.w,
        fit: BoxFit.cover,
        // 图片加载错误时的处理
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
    );
  }

  @override
  Widget build(BuildContext context) {
    // 新闻的基本信息, 列形式, 从上到下依次为: 渠道名, 标题, row(分类, 时间, actions)
    Widget _summary = SizedBox(
      // 不管是左右, 上下, 还是无图结构, 高度都是 121
      height: 121.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 渠道
          Text(
            data.channel,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: context.subtitle1,
          ).onTap(() {
            toast('News channel clicked.');
          }),
          // 标题
          Text(
            data.title,
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: context.h4,
          ).onTap(() {
            toast('News title clicked.');
          }),
          // 分类, 时间, actions
          Row(
            children: <Widget>[
              // 这里不要用 TextButton, 会撑开位置造成溢出
              Text(data.category!, style: context.linkText).onTap(() {
                toast('news category clicked.');
              }),
              SizedBox(width: 15.w),
              Text(
                '•   ${data.createdAt.agoStyle}',
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
    );
    Widget _widget = Container();
    if (data.thumbnail == null) {
      _widget = _summary;
    } else {
      if (style == 0) {
        // 左右风格
        _widget = Row(children: [
          _buildCover(),
          SizedBox(width: 20.w),
          Expanded(child: _summary),
        ]);
      } else if (style == 1) {
        // 上下风格
        _widget = Column(children: [
          _buildCover(width: 335.w, height: 207.h),
          SizedBox(height: 20.h),
          _summary,
        ]);
      } else {
        // 无封面图风格
        _widget = _summary;
      }
    }

    return Container(
      padding: EdgeInsets.all(20.w),
      child: _widget,
      // 每行都带一条下划线
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.dividerColor),
        ),
      ),
    );
  }
}
