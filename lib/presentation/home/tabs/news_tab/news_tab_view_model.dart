import 'package:flutter/material.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/model/article.dart' show Article;
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/model/source.dart';

class NewsTabViewModel extends ChangeNotifier {
  final Category category;

  NewsTabViewModel({required this.category});

  List<Source> sources = [];
  String newsErrorMessage = "";
  bool newsIsLoading = false;

  Future<void> getSources() async {
    newsIsLoading = true;
    notifyListeners();
    try {
      var response = await RetrofitService.instance.getSources(
        category: category.id,
      );
      sources = response.sources ?? [];
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

  List<Article> articles = [];
  bool articleIsLoading = false;
  String articleErrorMessage = '';

  Future<void> getArticles(int index) async {
    articleIsLoading = true;
    notifyListeners();
    var selectedSourceId = sources[index].id ?? "";
    try {
      var response = await RetrofitService.instance.getArticles(
        sources: selectedSourceId,
      );
      articles = response.articles ?? [];
    } catch (e) {
      articleErrorMessage = e.toString();
    } finally {
      articleIsLoading = false;
      notifyListeners();
    }
  }
}
