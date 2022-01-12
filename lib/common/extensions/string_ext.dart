import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto show sha256;
import 'package:flutter/material.dart';

extension NullableStringExtensions on String? {
  bool get isNull => this == null;

  bool get isNullOrEmpty => this?.isEmpty ?? true;
}

extension StringExtensions on String {
  bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  /// 是否是邮箱
  bool get isEmail {
    if (isEmpty) return false;
    String reg = '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$';
    return RegExp(reg).hasMatch(this);
  }

  /// 是否是固定电话号码
  bool get isMobilePhoneNumber {
    if (length != 11) return false;
    return hasMatch(this, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  /// 是否是移动电话(手机)号码
  bool get isTelphoneNumber {
    if (isEmpty) return false;
    return hasMatch(this, r'^((d{3,4})|d{3,4}-|s)?d{7,14}$');
  }

  /// 判断是否是手机号码或电话号码 (中国)
  bool get isPhoneNumber {
    return isMobilePhoneNumber || isTelphoneNumber;
  }

  /// SHA-256
  String get sha256 {
    String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO';
    var bytes = utf8.encode(this + salt);
    var digest = crypto.sha256.convert(bytes);
    return digest.toString();
  }

  Text apply({
    TextStyle? style,
    Color? color,
    FontWeight? fontWeight,
    String? fontFamily,
  }) {
    return Text(
      this,
      style: style != null
          ? style.copyWith(
              color: color,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            )
          : TextStyle(
              color: color,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
            ),
    );
  }

  // Text toText({
  //   Color? color,
  //   double? fontSize,
  //   String? fontFamily,
  // }) {
  //   if (color == null || fontSize == null && fontFamily == null) {
  //     return Text(this);
  //   }
  //   return Text(
  //     this,
  //     style: TextStyle(
  //       color: color,
  //       fontSize: fontSize,
  //       fontFamily: fontFamily,
  //     ),
  //   );
  // }

  // void print() {
  //   debugPrint(this);
  // }
}
