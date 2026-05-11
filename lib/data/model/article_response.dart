import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalResults")
  final int? totalResults;
  @JsonKey(name: "articles")
  final List<Article>? articles;

  ArticleResponse({this.status, this.totalResults, this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return _$ArticleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticleResponseToJson(this);
  }
}
