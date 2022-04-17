import 'package:json_annotation/json_annotation.dart';

part 'comment_entity.g.dart';

@JsonSerializable()
class CommentEntity {
  final int id;
  final String nick;
  final String avatar;
  final String? content;
  final DateTime createdAt;

  CommentEntity(this.id, this.nick, this.avatar, this.content, this.createdAt);

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);
}
