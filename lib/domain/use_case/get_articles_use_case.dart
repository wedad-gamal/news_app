import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/repository/news_repository.dart';

@injectable
class GetArticlesUseCase {
  final NewsRepository _newsRepository;
  GetArticlesUseCase(this._newsRepository);
  Future<List<ArticleEntity>> call(String sourceId) async {
    return await _newsRepository.getArticles(sourceId);
  }
}
