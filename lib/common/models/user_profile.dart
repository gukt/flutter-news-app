import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
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
  final List<String> channels;

  UserProfile(this.avatar, this.name, this.twitter, this.bookmarkNum,
      this.mailNum, this.memberPlan, this.memberExpiredAt, this.createdAt,
      {required this.token, required this.nick, required this.channels});

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
