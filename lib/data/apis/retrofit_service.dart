import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/data/model/article_response.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../model/article.dart';
import '../model/source.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class RetrofitService {
  static RetrofitService? _instance;

  static RetrofitService get instance {
    if (_instance != null) return _instance!;

    Dio _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${dotenv.maybeGet('API_KEY', fallback: '')}",
    };

    _dio.interceptors.add(PrettyDioLogger());

    // customization
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        maxWidth: 140,
        enabled: kDebugMode,
      ),
    );

    _instance ??= _RetrofitService(_dio);
    return _instance!;
  }

  factory RetrofitService._(Dio dio) = _RetrofitService;

  @GET('/top-headlines/sources')
  Future<SourceResponse> getSources({@Query("category") String? category});

  @GET('/top-headlines')
  Future<ArticleResponse> getArticles({@Query("sources") String? sources});
}
