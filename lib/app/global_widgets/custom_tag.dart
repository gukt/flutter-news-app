import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_colors.dart';

class CustomTag extends StatelessWidget {
  final String data;
  const CustomTag(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 19.w,
      ),
      child: Text('#$data', style: context.h5),
    );
  }
}

/// 创建一个标签组
///
/// 该标签组可以有两种方式显示：1. 单行可滚动方式; 2.多行换行方式。
///
/// 显示方式是通过 [inline] 参数控制的。true 表示单行滚动方式。
///
/// 如果是单行显示，比较好的效果是：左移时应该允许内容可以滚动到屏幕最左边，
/// 随后继续滚动被隐藏。因此，该组件不应该被防止在有 margin 或 padding 的容器中。
/// 要想有前后的间隔可通过 [leadingSpacing] 和 [trailingSpacing] 来设置。
///
/// 参数 [spacing] 用以控制相邻元素之间间隔。
class AppTagList extends StatelessWidget {
  final List<String> tags;
  final bool inline;
  final double? spacing;
  final double? leadingSpacing;
  final double? trailingSpacing;
  const AppTagList(
    this.tags, {
    Key? key,
    this.spacing,
    this.inline = false,
    this.leadingSpacing,
    this.trailingSpacing,
  })  : assert(tags.length > 0, '[tags] must not be empty.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = tags.map<Widget>((e) => CustomTag(e)).toList();
    return inline
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: spacing ?? 10.w,
              children: widgets
                // 插入前置间隔
                ..insert(0, SizedBox(width: leadingSpacing?.w))
                // 插入末尾间隔
                ..insert(widgets.length, SizedBox(width: trailingSpacing?.w)),
            ),
          )
        : Wrap(
            spacing: spacing ?? 10.w,
            runSpacing: spacing ?? 10.w,
            children: widgets,
          );
  }
}
