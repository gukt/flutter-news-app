import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserEntity {
  final String token;
  final String nick;
  final String avatar;
  final String name; // email
  final String twitter;
  final int bookmarkNum;
  final int mailNum;
  final int memberPlan;
  final DateTime memberExpiredAt;
  final DateTime createdAt;
  final List<List<String>>? channels;

  UserEntity(this.avatar, this.name, this.twitter, this.bookmarkNum,
      this.mailNum, this.memberPlan, this.memberExpiredAt, this.createdAt,
      {required this.token, required this.nick, this.channels});

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
