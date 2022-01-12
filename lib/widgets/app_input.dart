import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 全局通用的文本输入框
///
class AppTextField extends StatefulWidget {
  /// 没有内容时显示的提示信息
  final String? hintText;

  /// 对正在输入的文本进行控制的控制器
  final TextEditingController? controller;

  /// 输入文本时弹出的键盘类型
  final TextInputType keyboardType;

  final FocusNode? focusNode;
  final Color? backgroundColor;

  /// 创建一个 [AppTextField] 实例
  const AppTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  var passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('AppTextField is building...');

    var suffixIcon = widget.keyboardType == TextInputType.visiblePassword
        ? IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          )
        : null;

    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      // 是否自动获得焦点（在没有任何其他组件已获得焦点的情况下）
      autofocus: widget.focusNode != null,
      // 是否对输入内容进行模糊处理（就是指常见密码输入时自动遮住的那种表现）
      obscureText: widget.keyboardType == TextInputType.visiblePassword,
      // 禁用自动纠错（组件默认是开启的）
      autocorrect: false,
      style: TextStyle(
        fontSize: 18.sp,
        color: const Color.fromRGBO(45, 45, 47, 1),
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        // 背景色，仅在 [filled] 属性为 true 时才生效
        fillColor: widget.backgroundColor ?? AppColors.primarySurface,
        // 内容内边距，影响高度
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 9),
        // 边框样式，默认有下划线边框，如果不需要边框，请设置为 none
        // 如果要设置圆角边框, 需要通过 OutlineInputBorder 来设置
        border: OutlineInputBorder(
          // 因为没有边框线, 所以这里设置为 none
          borderSide: BorderSide.none,
          // 设置边框为圆角
          borderRadius: BorderRadius.circular(6),
        ),
        // 仅在输入框类型为密码框时才显示后缀小眼睛图标
        suffixIcon: suffixIcon,
      ),
    );
  }
}
