import 'package:flutter/material.dart';

/// 全局通用的按钮
///
class AppTextButton extends StatelessWidget {
  /// 按钮上显示的文本
  final Widget? text;

  /// 按钮点击事件处理
  final VoidCallback? onPressed;

  /// 按钮内边距，如果为 null，则使用 [TextButton] 的默认值。
  final EdgeInsetsGeometry? padding;

  /// 按钮外边距，如果为 null，则使用 [TextButton] 的默认值。
  final EdgeInsetsGeometry? margin;

  /// 宽度
  ///
  /// * 如果要占满父级允许的最大宽度，请设置为 `double.infinity`
  /// * 如果不设置宽度，则此按钮的高度由文字宽度加上 [padding] 决定。
  final double? width;

  /// 高度
  ///
  /// 如果不设置高度，则此按钮的高度由文字高度加上 [padding] 决定。
  final double? height;

  /// 背景颜色
  final Color? backgroundColor;

  /// 前景颜色，即按钮上的文本颜色
  final Color? foregroundColor;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;

  const AppTextButton(
    this.text, {
    Key? key,
    this.onPressed,
    this.padding,
    this.margin,
    this.width,
    this.height = 44,
    this.backgroundColor = const Color.fromRGBO(246, 246, 246, 1),
    this.foregroundColor = const Color.fromRGBO(45, 45, 47, 1),
    this.borderRadius = 6.0,
    this.borderWidth,
    this.borderColor = const Color.fromRGBO(246, 246, 246, 1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: text ?? const Text('Button'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
        ),
      ),
    );
  }
}
