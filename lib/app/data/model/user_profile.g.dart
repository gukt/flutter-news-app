// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      json['avatar'] as String,
      json['name'] as String,
      json['twitter'] as String,
      json['bookmarkNum'] as int,
      json['mailNum'] as int,
      json['memberPlan'] as int,
      DateTime.parse(json['memberExpiredAt'] as String),
      DateTime.parse(json['createdAt'] as String),
      token: json['token'] as String,
      nick: json['nick'] as String,
      // channels:
      //     (json['channels'] as List<List<String>>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'nick': instance.nick,
      'avatar': instance.avatar,
      'name': instance.name,
      'twitter': instance.twitter,
      'bookmarkNum': instance.bookmarkNum,
      'mailNum': instance.mailNum,
      'memberPlan': instance.memberPlan,
      'memberExpiredAt': instance.memberExpiredAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'channels': instance.channels,
    };
