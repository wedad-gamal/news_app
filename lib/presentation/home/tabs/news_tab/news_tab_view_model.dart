import 'package:flutter/material.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/model/article.dart' show ArticleDto;
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/model/source.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/domain/entity/article_entity.dart';
import 'package:news_app/domain/entity/source_entity.dart';

class NewsTabViewModel extends ChangeNotifier {
  final Category category;
  final NewsRepository _newsRepository;
  NewsTabViewModel(this.category, this._newsRepository);

  List<SourceEntity> sources = [];
  String newsErrorMessage = "";
  bool newsIsLoading = false;

  Future<void> getSources() async {
    newsIsLoading = true;
    notifyListeners();
    try {
      var response = await _newsRepository.getSources(category.id);
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
      var response = await _newsRepository.getArticles(selectedSourceId);
      articles = response;
    } catch (e) {
      articleErrorMessage = e.toString();
    } finally {
      articleIsLoading = false;
      notifyListeners();
    }
  }
}
