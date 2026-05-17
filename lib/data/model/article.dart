import 'package:json_annotation/json_annotation.dart';
import 'package:hive_ce/hive_ce.dart';

import 'source.dart';

part 'article.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class ArticleDto {
  @JsonKey(name: "source")
  @HiveField(0)
  final SourceDto? source;

  @JsonKey(name: "author")
  @HiveField(1)
  final String? author;

  @JsonKey(name: "title")
  @HiveField(2)
  final String? title;

  @JsonKey(name: "description")
  @HiveField(3)
  final String? description;

  @JsonKey(name: "url")
  @HiveField(4)
  final String? url;

  @JsonKey(name: "urlToImage")
  @HiveField(5)
  final String? urlToImage;

  @JsonKey(name: "publishedAt")
  @HiveField(6)
  final String? publishedAt;

  @JsonKey(name: "content")
  @HiveField(7)
  final String? content;

  ArticleDto({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    return _$ArticleDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticleDtoToJson(this);
  }
}
