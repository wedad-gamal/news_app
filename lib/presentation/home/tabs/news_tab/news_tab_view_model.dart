import 'package:flutter/material.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/model/article.dart' show ArticleDto;
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';
import 'package:news_app/domain/use_case/get_articles_use_case.dart';
import 'package:news_app/domain/use_case/get_sources_use_case.dart';

class NewsTabViewModel extends ChangeNotifier {
  final Category category;
  final GetSourcesUseCase _getSourcesUseCase;
  final GetArticlesUseCase _getArticlesUseCase;
  NewsTabViewModel(
    this.category,
    this._getSourcesUseCase,
    this._getArticlesUseCase,
  );

  List<SourceEntity> sources = [];
  String newsErrorMessage = "";
  bool newsIsLoading = false;

  Future<void> getSources() async {
    newsIsLoading = true;
    notifyListeners();
    try {
      var response = await _getSourcesUseCase(category.id);
      sources = response;
      if (sources.isNotEmpty) {
        getArticles(0);
      }
    } catch (e) {
      newsErrorMessage = e.toString();
    } finally {
      newsIsLoading = false;
      notifyListeners();
    }
  }

  List<ArticleEntity> articles = [];
  bool articleIsLoading = false;
  String articleErrorMessage = '';

  Future<void> getArticles(int index) async {
    articleIsLoading = true;
    notifyListeners();
    var selectedSourceId = sources[index].id ?? "";
    try {
      var response = await _getArticlesUseCase(selectedSourceId);
      articles = response;
    } catch (e) {
      articleErrorMessage = e.toString();
    } finally {
      articleIsLoading = false;
      notifyListeners();
    }
  }
}
