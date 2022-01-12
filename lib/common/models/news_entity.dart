import 'package:json_annotation/json_annotation.dart';

part 'news_entity.g.dart';

@JsonSerializable()
class NewsEntity {
  final int id;
  final String title;
  final String channel;
  final String? category;
  final String? content;
  final String? url;
  final String? thumbnail;
  final String author;
  final DateTime createdAt;

  NewsEntity(this.id, this.title, this.url, this.thumbnail, this.author,
      this.category, this.createdAt, this.content, this.channel);

  factory NewsEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$NewsEntityToJson(this);
}
