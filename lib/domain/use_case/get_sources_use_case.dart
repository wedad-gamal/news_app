import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class GetSourcesUseCase {
  final NewsRepository _newsRepository;
  GetSourcesUseCase(this._newsRepository);
  Future<List<SourceEntity>> call(String categoryId) async {
    return await _newsRepository.getSources(categoryId);
  }
}
