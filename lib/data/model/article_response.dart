import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleReponse {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "totalResults")
  final int? totalResults;
  @JsonKey(name: "articles")
  final List<Article>? articles;

  ArticleReponse({this.status, this.totalResults, this.articles});

  factory ArticleReponse.fromJson(Map<String, dynamic> json) {
    return _$ArticleReponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticleReponseToJson(this);
  }
}
