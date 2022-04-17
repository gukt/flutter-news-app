import 'dart:ui';

abstract class FontWeights {
  FontWeights._();

  /// 等效于 FontWeight.w700 或 FontWeight.bold
  static const bold = FontWeight.bold;

  /// 等效于 FontWeight.w600
  static const semibold = FontWeight.w600;

  /// 等效于 FontWeight.w500
  static const medium = FontWeight.w500;

  /// 等效于 FontWeight.w400 或 FontWeight.normal
  @FontWeight.w400
  static const normal = FontWeight.normal;

  /// 等效于 FontWeight.w400 或 FontWeight.normal
  @FontWeight.w400
  static const book = FontWeight.normal;

  /// 等效于 FontWeight.w300
  static const light = FontWeight.w300;
}
