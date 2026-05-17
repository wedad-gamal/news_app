import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';

abstract interface class NewsLocalDataSource {
  Future<void> saveSources(List<SourceDto> sources, String categoryId);
  Future<List<SourceDto>> getSources(String categoryId);
  Future<void> saveArticles(List<ArticleDto> articles, String sourceId);
  Future<List<ArticleDto>> getArticles(String sourceId);
}
