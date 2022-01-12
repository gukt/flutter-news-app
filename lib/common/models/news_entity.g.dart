// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsEntity _$NewsEntityFromJson(Map<String, dynamic> json) => NewsEntity(
      json['id'] as int,
      json['title'] as String,
      json['url'] as String?,
      json['thumbnail'] as String?,
      json['author'] as String,
      json['category'] as String?,
      DateTime.parse(json['createdAt'] as String),
      json['content'] as String?,
      json['channel'] as String,
    );

Map<String, dynamic> _$NewsEntityToJson(NewsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'channel': instance.channel,
      'category': instance.category,
      'content': instance.content,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'author': instance.author,
      'createdAt': instance.createdAt.toIso8601String(),
    };
