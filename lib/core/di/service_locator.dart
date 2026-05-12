import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/di/modules/network_module.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/data_source/contract/news_remote_data_source.dart';
import 'package:news_app/data/data_source/implementation/news_remote_data_source.dart';
import 'package:news_app/data/mapper/news_mapper.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/use_case/get_articles_use_case.dart';
import 'package:news_app/domain/use_case/get_sources_use_case.dart';
import 'package:news_app/presentation/home/tabs/news_tab/news_tab_view_model.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => provideDio());

  // Retrofit
  getIt.registerLazySingleton<RetrofitService>(
    () => RetrofitService(getIt<Dio>()),
  );

  // News Remote Data Source
  getIt.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(getIt<RetrofitService>()),
  );

  // News Mapper
  getIt.registerLazySingleton<NewsMapper>(() => NewsMapper());

  // News Repository
  getIt.registerLazySingleton<NewsRepository>(
    () =>
        NewsRepositoryImpl(getIt<NewsRemoteDataSource>(), getIt<NewsMapper>()),
  );

  // Use Cases
  getIt.registerLazySingleton<GetSourcesUseCase>(
    () => GetSourcesUseCase(getIt<NewsRepository>()),
  );
  getIt.registerLazySingleton<GetArticlesUseCase>(
    () => GetArticlesUseCase(getIt<NewsRepository>()),
  );

  getIt.registerFactory<NewsTabViewModel>(
    () => NewsTabViewModel(
      getIt<GetSourcesUseCase>(),
      getIt<GetArticlesUseCase>(),
    ),
  );
}
