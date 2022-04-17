import 'package:flutter/material.dart';

extension GestureDetectorExtension on Widget {
  Widget onTap(
    VoidCallback? callback, {
    bool inkWell = true,
  }) {
    // 需要检查 Widget
    return inkWell
        ? InkWell(
            onTap: callback ?? () {},
            child: this,
          )
        : GestureDetector(
            onTap: callback ?? () {},
            child: this,
          );
  }
}

extension WidgetExtensions on Widget {
  Container decorate({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    BoxShape shape = BoxShape.rectangle,
    List<BoxShadow>? shadows,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        shape: shape,
        boxShadow: shadows,
      ),
      child: this,
    );
  }

  @Deprecated('???')
  Container margin({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  @Deprecated('???')
  Container marginLeft(double value) {
    return Container(
      margin: EdgeInsets.only(left: value),
      child: this,
    );
  }

  @Deprecated('???')
  Container marginTop(double value) {
    return Container(
      margin: EdgeInsets.only(top: value),
      child: this,
    );
  }

  @Deprecated('???')
  Container marginRight(double value) {
    return Container(
      margin: EdgeInsets.only(right: value),
      child: this,
    );
  }

  @Deprecated('???')
  Container marginBottom(double value) {
    return Container(
      margin: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  @Deprecated('???')
  Container marginAll(double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }

  @Deprecated('???')
  Container marginSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      child: this,
    );
  }

  @Deprecated('???')
  Padding padding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  @Deprecated('???')
  Padding paddingLeft(double left) {
    return padding(left: left);
  }

  @Deprecated('???')
  Padding paddingTop(double top) {
    return padding(top: top);
  }

  @Deprecated('???')
  Padding paddingRight(double right) {
    return padding(right: right);
  }

  @Deprecated('???')
  Padding paddingBottom(double bottom) {
    return padding(bottom: bottom);
  }

  @Deprecated('???')
  Padding paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding,
        top: padding,
        right: padding,
        bottom: padding,
      ),
      child: this,
    );
  }

  @Deprecated('???')
  Widget expandWith() {
    return SizedBox(width: double.infinity, child: this);
  }
}

extension IconExtension on IconData {
  Icon toIcon({Color? color, double? size}) {
    return Icon(
      this,
      color: color,
      size: size,
    );
  }
}

extension ButtonStyleExtension on ButtonStyle {
  ButtonStyle size<T>({double? width, double? height}) {
    return copyWith(
      fixedSize: MaterialStateProperty.all(
        Size(
          width ?? double.infinity,
          height ?? double.infinity,
        ),
      ),
    );
  }

  ButtonStyle get fitWidth {
    return size(width: double.maxFinite);
  }

  ButtonStyle get fitHeight {
    return copyWith(
      fixedSize: MaterialStateProperty.all(
        const Size.fromHeight(double.maxFinite),
      ),
    );
  }
}

extension TextStyleExtension on TextStyle? {
  @Deprecated('个人觉得这样写还是没有原生的写法好,原生的写熟悉了容易理解')
  Text applyTo(
    String text, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return Text(
      text,
      style: this == null
          ? TextStyle(
              color: color,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            )
          : this!.copyWith(
              color: color,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
    );
  }
}
