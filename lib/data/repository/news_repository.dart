import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/contract/news_local_data_source.dart';
import 'package:news_app/data/data_source/contract/news_remote_data_source.dart';
import 'package:news_app/data/data_source/implementation/news_remote_data_source.dart';
import 'package:news_app/data/mapper/news_mapper.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _newsRemoteDataSource;
  final NewsLocalDataSource _newsLocalDataSource;
  final NewsMapper _newsMapper;
  NewsRepositoryImpl(
    this._newsRemoteDataSource,
    this._newsLocalDataSource,
    this._newsMapper,
  );

  @override
  Future<List<SourceEntity>> getSources(String categoryId) async {
    late List<SourceDto> response;
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      response = await _newsRemoteDataSource.getSources(categoryId);
      await _newsLocalDataSource.saveSources(response, categoryId);
    } else {
      response = await _newsLocalDataSource.getSources(categoryId);
    }
    return _newsMapper.mapSourceDtosToSourceEntities(response);
  }

  @override
  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    late List<ArticleDto> response;
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      response = await _newsRemoteDataSource.getArticles(sourceId);
      await _newsLocalDataSource.saveArticles(response, sourceId);
    } else {
      response = await _newsLocalDataSource.getArticles(sourceId);
    }
    return _newsMapper.mapArticleDtosToArticleEntities(response);
  }
}
