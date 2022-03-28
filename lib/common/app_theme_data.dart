import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/extensions/theme_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_button_styles.dart';
import 'app_colors.dart';

class AppThemeData {
  static const TextStyle _headlineStyle = TextStyle(
    color: AppColors.primaryText,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _bodyTextStyle = TextStyle(
    color: AppColors.primaryText,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  /// 全局设定一个 IconThemeData, 用于所有图标样式
  static final IconThemeData _iconThemeData = IconThemeData(
    size: 28.sp,
    color: AppColors.primaryText,
  );

  static ThemeData light1 = ThemeData(
    brightness: Brightness.light,
    // App 主要部分的背景色, 如: App bar, Tool bar, Tab bar
    // 定义了这好像没起作用,还是在 colorScheme 里定义有作用
    // primaryColor: Colors.green,
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.red,
      ),
    ),
    // 修改此处需要点刷新(重启)按钮
    colorScheme: const ColorScheme.light(
      // 影响: appbar , elevated 按钮表明颜色, navigateBottom 选中颜色, 进度条颜色, process indicator 颜色, 按钮文字颜色( elevated 除外,因为它的背景是 primary,所以自就成了默认的白色了)
      // 默认输入框下面的线, 进度条的颜色(背景色是由 background 决定的)
      // navitem 的选中颜色
      // 没有对 floatAction 产生影响, 它是收 secondaryColor 影响的
      primary: Colors.amber,
      onPrimary: Colors.black,
      secondary: Colors.deepOrange,
      onSecondary: Colors.white,
      // 应用的组件: 进度条的背景,
      background: Colors.green,
      onBackground: Colors.blue,
      surface: Colors.red,
      // 影响: 输入框下划线
      onSurface: Colors.cyanAccent,
    ),
  );
  static ThemeData dark1 = ThemeData();

  /// 明亮主题
  static ThemeData light = ThemeData(
    // 每个主题都要设置亮度
    brightness: Brightness.light,
    // 设置 Scaffold 组件的 body 背景色, 如果不设置, 默认淡灰色
    scaffoldBackgroundColor: Colors.white,
    // 默认字体
    fontFamily: 'Avenir',
    // AppBar 主题
    appBarTheme: AppBarTheme(
      // 整体背景色
      backgroundColor: Colors.white,
      // 标题栏样式
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.primaryText,
        fontSize: 18.sp,
      ),
      // 设置底部分隔线的阴影高度, 设置为 0 表示隐藏底部分割线
      elevation: 0,
      // 阴影(分割线)颜色
      shadowColor: AppColors.dividerColor,
      // 图标颜色, 即使设置了全局的 iconTheme, 这里也要设置, 不然颜色会覆盖
      iconTheme: _iconThemeData,
      actionsIconTheme: _iconThemeData,
    ),
    // 底部导航栏主题
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.navElementSelected,
      unselectedItemColor: AppColors.navElement,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    // ListTile 主题
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 4.h,
      ),
      textColor: AppColors.primaryText,
      // 整条 tile 的背景色, 默认为透明
      tileColor: Colors.white,
    ),
    // 分隔符主题
    dividerTheme: DividerThemeData(
      // 将分隔符的高度设为 1, 不设置的话默认为 16，影响布局时的思考。
      space: 1.h,
      color: AppColors.dividerColor,
    ),
    // 设置文本主题
    textTheme: Typography()
        .black
        .copyWith(
          // h1, h2: Bold
          // h3, h4: Semibold
          // h5, h6: Medium
          headline1: _headlineStyle.copyWith(
            fontSize: 36.sp,
          ),
          headline2: _headlineStyle.copyWith(
            fontSize: 30.sp,
          ),
          headline3: _headlineStyle.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          headline4: _headlineStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          headline5: _headlineStyle.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          headline6: _headlineStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: TextStyle(
            fontSize: 14.sp,
            color: AppColors.secondaryText,
          ),
          subtitle2: TextStyle(
            fontSize: 12.sp,
            color: AppColors.secondaryText,
          ),
          // 正文文本强调样式
          // 比默认的正文文本样式 [bodyText2] 粗一点，大小相同
          bodyText1: _bodyTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          // 界面上的文本，如果不设置任何样式，使用的是 bodyText2
          bodyText2: _bodyTextStyle.copyWith(fontSize: 18.sp),
          // 用于定义 TextButton, ElevatedButton, OutlinedButton 上文字的样式
          // button: TextStyle(
          //   color: Colors.white,
          //   fontSize: 18.sp,
          //   fontFamily: 'Montserrat',
          //   fontWeight: FontWeights.semibold,
          //   height: 1,
          // ),
        )
        .extend(
      {
        // 由于默认只提供了 bodyText1, bodyText2 两种,
        // 有时候不够用，所以利用自定义的 [extend] 扩展方法 以支持定义一些扩展样式
        'bodyText3': _bodyTextStyle.copyWith(fontSize: 16.sp),
        'bodyText4': _bodyTextStyle.copyWith(fontSize: 14.sp),
        'bodyText5': _bodyTextStyle.copyWith(fontSize: 12.sp),
        'bodyText6': _bodyTextStyle.copyWith(fontSize: 10.sp),
      },
    ),

    textButtonTheme: TextButtonThemeData(
      style: AppButtonStyles.primary,
    ),

    // textButtonTheme: ButtonStyles.primary,
    // // 全局 icon 主题
    iconTheme: _iconThemeData,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black,
  );
}
