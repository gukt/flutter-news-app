import 'package:flutter/material.dart';

/// 主要的 - 边框颜色
const Color primaryBorderColor = Color.fromARGB(255, 230, 230, 231);

/// 主要的 - 边界线 [BorderSide]
///
/// 默认宽度为 1,线型为 solid, 颜色使用 [primaryBorderColor]
///
/// 所谓边框边界线是由: 边框颜色, 线框, 线型等组成的
const BorderSide primaryBorderSide = BorderSide(
  color: primaryBorderColor,
);

/// 主要的 - 阴影颜色
const Color primaryShadowColor = Color.fromRGBO(27, 27, 29, .15);

/// 主要的 - 阴影 [BoxShadow]
const BoxShadow primaryShadow = BoxShadow(
  color: primaryShadowColor,
  offset: Offset(0, 5),
  blurRadius: 10,
);
