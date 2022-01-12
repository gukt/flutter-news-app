import 'package:flutter/material.dart';

class AppSimpleTile extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  const AppSimpleTile({
    Key? key,
    this.padding,
    this.leading,
    this.title,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: Row(children: [
        if (leading != null) leading!,
        if (title != null) title!,
        const Spacer(),
        if (trailing != null) trailing!,
      ]),
    );
  }
}
