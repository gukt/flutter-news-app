import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    Key? key,
    this.padding,
    this.leading,
    this.title,
    this.trailing,
  }) : super(key: key);

  final EdgeInsets? padding;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20.0),
        child: Row(children: [
          if (leading != null) leading!,
          if (title != null)
            DefaultTextStyle(child: title!, style: context.h4!),
          const Spacer(),
          if (trailing != null)
            DefaultTextStyle(child: trailing!, style: context.linkText!),
        ]),
      ),
    );
  }
}
