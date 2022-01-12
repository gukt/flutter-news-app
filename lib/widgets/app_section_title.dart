import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@Deprecated('ListTile 就很好')
class AppSectionTitle extends StatelessWidget {
  final String? title;
  // TODO 要扩展成数组？如果不扩展，将名称改为 action
  final Widget? actions;
  final EdgeInsetsGeometry? contentPadding;
  const AppSectionTitle({
    Key? key,
    this.title,
    this.actions,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: <Widget>[
          if (title != null) Text(title!, style: context.h3),
          const Spacer(),
          if (actions != null) actions!,
        ],
      ),
    );
  }
}
