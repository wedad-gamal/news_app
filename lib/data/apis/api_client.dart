// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart' show kDebugMode;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:news_app/data/model/articles_response.dart';
// import 'package:news_app/data/model/category.dart';
// import 'package:news_app/data/model/news_response.dart';
// import 'package:news_app/data/model/sources_response.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class ApiClient {
//   Dio _dio = Dio();
//   Category? selectedCategory;
//   SourcesResponse? sourcesResponse;
//   ApiClient._() {
//     _dio.options = BaseOptions(
//       baseUrl: "https://newsapi.org/v2/",
//       receiveDataWhenStatusError: true,
//       connectTimeout: Duration(seconds: 30),
//       receiveTimeout: Duration(seconds: 30),
//     );
//     _dio.options.headers = {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//       "Authorization": "Bearer ${dotenv.maybeGet('API_KEY', fallback: '')}",
//     };

//     _dio.interceptors.add(PrettyDioLogger());

//     // customization
//     _dio.interceptors.add(
//       PrettyDioLogger(
//         requestHeader: true,
//         requestBody: true,
//         responseBody: true,
//         responseHeader: false,
//         error: true,
//         maxWidth: 140,
//         enabled: kDebugMode,
//       ),
//     );
//   }
//   static ApiClient? _instance;
//   static ApiClient get instance => _instance ??= ApiClient._();

//   Future<SourcesResponse> getSources(Category category) async {
//     if (selectedCategory?.id == category.id && sourcesResponse != null) {
//       return sourcesResponse!;
//     }
//     selectedCategory = category;
//     var response = await _dio.get(
//       "top-headlines/sources",
//       queryParameters: {"category": category.id},
//     );
//     return sourcesResponse ??= SourcesResponse.fromJson(response.data);
//   }

//   void resetApi() {
//     selectedCategory = null;
//     sourcesResponse = null;
//   }

//   Future<ArticleResponse> getArticles(String sourceId) async {
//     var response = await _dio.get(
//       "top-headlines",
//       queryParameters: {"sources": sourceId},
//     );
//     return ArticleResponse.fromJson(response.data);
//   }
// }
