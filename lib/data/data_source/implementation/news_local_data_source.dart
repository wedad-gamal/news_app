import 'package:hive_ce/hive_ce.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source/contract/news_local_data_source.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';

@Injectable(as: NewsLocalDataSource)
class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<void> saveSources(List<SourceDto> sources, String categoryId) async {
    var box = await Hive.openBox("sources");
    await box.put(categoryId, sources);
    await box.close();
  }

  @override
  Future<List<ArticleDto>> getArticles(String sourceId) async {
    var box = await Hive.openBox("articles");
    var articles = box.get(sourceId);
    await box.close();
    if (articles == null) return [];
    return articles.cast<ArticleDto>();
  }

  @override
  Future<List<SourceDto>> getSources(String categoryId) async {
    var box = await Hive.openBox<List>("sources");
    final sources = box.get(categoryId);
    await box.close();
    if (sources == null) return [];
    return sources.cast<SourceDto>();
  }

  @override
  Future<void> saveArticles(List<ArticleDto> articles, String sourceId) async {
    var box = await Hive.openBox("articles");
    await box.put(sourceId, articles);
    await box.close();
  }
}
