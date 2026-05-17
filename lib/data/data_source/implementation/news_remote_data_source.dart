import 'package:injectable/injectable.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/data_source/contract/news_remote_data_source.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final RetrofitService _retrofitService;

  const NewsRemoteDataSourceImpl(this._retrofitService);

  @override
  Future<List<SourceDto>> getSources(String categoryId) async {
    try {
      var response = await _retrofitService.getSources(category: categoryId);
      return response.sources ?? [];
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ArticleDto>> getArticles(String sourceId) async {
    try {
      var response = await _retrofitService.getArticles(sources: sourceId);
      return response.articles ?? [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
