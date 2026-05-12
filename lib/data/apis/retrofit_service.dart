import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/data/model/article_response.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class RetrofitService {
  factory RetrofitService(Dio dio) = _RetrofitService;

  @GET('/top-headlines/sources')
  Future<SourceResponse> getSources({@Query("category") String? category});

  @GET('/top-headlines')
  Future<ArticleResponse> getArticles({@Query("sources") String? sources});
}
