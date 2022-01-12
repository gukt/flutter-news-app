// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentEntity _$CommentEntityFromJson(Map<String, dynamic> json) =>
    CommentEntity(
      json['id'] as int,
      json['nick'] as String,
      json['avatar'] as String,
      json['content'] as String?,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CommentEntityToJson(CommentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nick': instance.nick,
      'avatar': instance.avatar,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
    };
