import 'package:flutter/material.dart';

/// App 全局颜色定义
///
/// 术语词汇： Primary, Secondary, Tertiary, Quaternary, and Quinary 依次表示：主要的、第二类、第三类、第四类和第五类。
class AppColors {
// === 文本颜色 ===

  /// [主要的] 文本色 - 深灰色
  ///
  /// 用于全局最基本的文本内容展示
  static const Color primaryText = Color.fromRGBO(45, 45, 47, 1);

  /// [第二种] 文本色 - 浅灰色
  ///
  /// 一般用于副标题、图片描述性文字等。
  static const Color secondaryText = Color.fromRGBO(141, 141, 142, 1);

  /// [第三种] 文本色 - 蓝色
  ///
  /// 一般用于链接等文本
  static const Color tertiaryText = Color.fromRGBO(41, 103, 255, 1);

// === 背景颜色 ===

  /// [主要的] 背景色 - 白色
  static const Color primaryBackground = Colors.white;

  /// [第二种] 背景色 - 灰色
  static const Color secondaryBackground = Color.fromRGBO(246, 246, 246, 1);

// === 表面颜色 ===

  /// [主要的] 组件表面颜色 - 蓝色
  static const Color primarySurface = Color.fromRGBO(41, 103, 255, 1);

  /// [第二种] 组件表明颜色 - 灰色
  static const Color secondarySurface = Color.fromRGBO(246, 246, 246, 1);

  /// [第三种] 组件表面颜色 - 石墨色
  static const Color tertiarySurface = primaryText;

// === 表面颜色 ===

  /// 导航栏元素默认颜色 - 灰色
  static const Color navElement = Color.fromRGBO(208, 208, 208, 1);

  /// 导航栏元素选中时的颜色 - 蓝色
  static const Color navElementSelected = Color.fromRGBO(41, 103, 255, 1);

  static const Color dividerColor = Color.fromRGBO(230, 230, 231, 1);
}
