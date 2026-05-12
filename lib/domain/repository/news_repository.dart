import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';

abstract interface class NewsRepository {
  Future<List<SourceEntity>> getSources(String categoryId);
  Future<List<ArticleEntity>> getArticles(String sourceId);
}
