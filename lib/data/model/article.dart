import 'package:json_annotation/json_annotation.dart';

import 'source.dart';

part 'article.g.dart';

@JsonSerializable()
class ArticleDto {
  @JsonKey(name: "source")
  final SourceDto? source;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "urlToImage")
  final String? urlToImage;
  @JsonKey(name: "publishedAt")
  final String? publishedAt;
  @JsonKey(name: "content")
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
