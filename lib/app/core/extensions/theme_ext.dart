import 'package:flutter/material.dart';

extension TextThemeExtensions on TextTheme {
  // TextStyle get bodyText3 => TextStyle(fontSize: 16.sp);
  // TextStyle get bodyText4 => TextStyle(fontSize: 14.sp);
  // TextStyle get bodyText5 => TextStyle(fontSize: 12.sp);
  // TextStyle get bodyText6 => TextStyle(fontSize: 10.sp);

  static final _extendedStyles = <String, TextStyle>{};

  TextTheme extend(Map<String, TextStyle> styles) {
    styles.forEach((key, value) {
      _extendedStyles[key] = value;
    });
    return this;
  }

  TextStyle? getExtended(String name) {
    return _extendedStyles[name];
  }

  // TextTheme extended({
  //   TextStyle? bodyText3,
  //   TextStyle? bodyText4,
  //   TextStyle? bodyText5,
  //   TextStyle? bodyText6,
  // }) {
  //   if (bodyText3 != null) {
  //     _extendedStyles['bodyText3'] = bodyText3;
  //   }
  //   return this;
  // }
}

@Deprecated('?')
extension TextStyleExtension on TextStyle {
  TextStyle size(double value) {
    return copyWith(fontSize: value);
  }

  TextStyle family(String value) {
    return copyWith(fontFamily: value);
  }

  TextStyle weight(FontWeight value) {
    return copyWith(fontWeight: value);
  }
}
