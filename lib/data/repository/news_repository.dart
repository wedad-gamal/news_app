import 'package:news_app/data/data_source/news_remote_data_source.dart';
import 'package:news_app/data/mapper/news_mapper.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';

class NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;
  final NewsMapper _newsMapper;
  NewsRepository(this._newsRemoteDataSource, this._newsMapper);

  Future<List<SourceEntity>> getSources(String categoryId) async {
    try {
      var response = await _newsRemoteDataSource.getSources(categoryId);
      return _newsMapper.mapSourceDtosToSourceEntities(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    try {
      var response = await _newsRemoteDataSource.getArticles(sourceId);
      return _newsMapper.mapArticleDtosToArticleEntities(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
