import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/extensions/theme_ext.dart';

import '../app_colors.dart';
import '../app_theme_data.dart';

extension BuildContextExtensions on BuildContext {
  /// 获取当前主题 [ThemeData]
  ThemeData get theme => Theme.of(this);

  /// 获取当前主题 [ThemeData] 中定义的文本主题 [TextTheme]
  TextTheme? get textTheme => theme.textTheme;

  // 定义一些用以访问文本主题样式的快捷属性

  /// headline1, 详细样式定义在 [AppThemeData]
  TextStyle? get h1 => theme.textTheme.headline1;

  /// headline2, 详细样式定义在 [AppThemeData]
  TextStyle? get h2 => theme.textTheme.headline2;

  /// headline3, 详细样式定义在 [AppThemeData]
  TextStyle? get h3 => theme.textTheme.headline3;

  /// headline4, 详细样式定义在 [AppThemeData]
  TextStyle? get h4 => theme.textTheme.headline4;

  /// headline5, 详细样式定义在 [AppThemeData]
  TextStyle? get h5 => theme.textTheme.headline5;

  /// headline6, 详细样式定义在 [AppThemeData]
  TextStyle? get h6 => theme.textTheme.headline6;

  // Subtitle 1-2
  TextStyle? get subtitle1 => theme.textTheme.subtitle1;
  TextStyle? get subtitle2 => theme.textTheme.subtitle2;

  // BodyText 1-6
  TextStyle? get bodyText1 => theme.textTheme.bodyText1;
  TextStyle? get bodyText2 => theme.textTheme.bodyText2;

  // NOTE: 下面的这些文本主题样式是扩展出来的, Futter 的 [TextTheme] 里并没有提供它们。
  // 这些扩展的文本样式是通过 [TextTheme] 的扩展方法 [TextThemeExtensions] 实现的
  // 具体的样式是在 [AppThemes] 中定义的。
  TextStyle? get bodyText3 => theme.textTheme.getExtended('bodyText3');
  TextStyle? get bodyText4 => theme.textTheme.getExtended('bodyText4');
  TextStyle? get bodyText5 => theme.textTheme.getExtended('bodyText5');
  TextStyle? get bodyText6 => theme.textTheme.getExtended('bodyText6');

  /// 链接样式
  TextStyle? get linkText => bodyText3!.copyWith(color: AppColors.tertiaryText);
}