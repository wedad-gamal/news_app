import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
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
    return _dio;
  }
}
