import 'package:json_annotation/json_annotation.dart';
part 'api_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResult<T> {
  final int code;
  final String msg;
  final T data;

  ApiResult(this.code, this.msg, this.data);

  factory ApiResult.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ApiResultFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResultToJson(this, toJsonT);
}
