import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppButtonStyles {
  /// App 按钮的基本样式
  /// 默认限制了最大高度和最小高度均为 44
  static final _baseStyle = TextButton.styleFrom(
    textStyle: TextStyle(fontSize: 18.sp),
    backgroundColor: AppColors.secondarySurface,
    // foregroundColor: AppColors.primaryText,
    // TODO 这里要好好搞一下, 怎么让宽度自适应, 设定高度固定
    maximumSize: Size(100, 44.sp),
    minimumSize: Size(20, 44.sp),
    fixedSize: Size.fromHeight(44.sp),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.w),
    ),
  );

  /// [主要的] 按钮样式 - 蓝色背景
  static ButtonStyle primary = _baseStyle.merge(
    TextButton.styleFrom(
      backgroundColor: AppColors.primarySurface,
    ),
  );

  /// [第二种] 按钮样式 - 灰色背景
  static final secondary = _baseStyle;

  /// [第三种] 按钮样式 - 石墨色背景
  static final tertiary = _baseStyle.merge(
    TextButton.styleFrom(
      backgroundColor: AppColors.tertiarySurface,
    ),
  );

  /// [第四种] 按钮样式 - 有外边框, 背景透明
  static final outlined = _baseStyle.merge(
    TextButton.styleFrom(
      backgroundColor: Colors.transparent,
    ),
  );
}
