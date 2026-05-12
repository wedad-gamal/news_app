import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';

class NewsMapper {
  List<SourceEntity> mapSourceDtosToSourceEntities(List<SourceDto> sourcesDto) {
    return sourcesDto
        .map((source) => _mapSourceDtoToSourceEntity(source))
        .toList();
  }

  SourceEntity _mapSourceDtoToSourceEntity(SourceDto sourceDto) {
    return SourceEntity(id: sourceDto.id, name: sourceDto.name);
  }

  Future<List<ArticleEntity>> mapArticleDtosToArticleEntities(
    List<ArticleDto> response,
  ) async {
    return response
        .map((article) => _mapArticleDtoToArticleEntity(article))
        .toList();
  }

  ArticleEntity _mapArticleDtoToArticleEntity(ArticleDto articleDto) {
    return ArticleEntity(
      author: articleDto.author,
      title: articleDto.title,
      description: articleDto.description,
      url: articleDto.url,
      urlToImage: articleDto.urlToImage,
      publishedAt: articleDto.publishedAt,
      content: articleDto.content,
    );
  }
}
