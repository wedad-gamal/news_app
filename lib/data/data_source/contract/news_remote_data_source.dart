import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<SourceDto>> getSources(String categoryId);
  Future<List<ArticleDto>> getArticles(String sourceId);
}
