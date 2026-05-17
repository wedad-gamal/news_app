// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/apis/retrofit_service.dart' as _i484;
import '../../data/data_source/contract/news_local_data_source.dart' as _i1039;
import '../../data/data_source/contract/news_remote_data_source.dart' as _i788;
import '../../data/data_source/implementation/news_local_data_source.dart'
    as _i890;
import '../../data/data_source/implementation/news_remote_data_source.dart'
    as _i181;
import '../../data/mapper/news_mapper.dart' as _i885;
import '../../data/repository/news_repository.dart' as _i217;
import '../../domain/repository/news_repository.dart' as _i432;
import '../../domain/use_case/get_articles_use_case.dart' as _i865;
import '../../domain/use_case/get_sources_use_case.dart' as _i860;
import '../../presentation/home/tabs/news_tab/news_tab_view_model.dart'
    as _i139;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i148;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i885.NewsMapper>(() => _i885.NewsMapper());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.factory<_i1039.NewsLocalDataSource>(
      () => _i890.NewsLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i484.RetrofitService>(
      () => _i484.RetrofitService(gh<_i361.Dio>()),
    );
    gh.factory<_i788.NewsRemoteDataSource>(
      () => _i181.NewsRemoteDataSourceImpl(gh<_i484.RetrofitService>()),
    );
    gh.factory<_i432.NewsRepository>(
      () => _i217.NewsRepositoryImpl(
        gh<_i788.NewsRemoteDataSource>(),
        gh<_i1039.NewsLocalDataSource>(),
        gh<_i885.NewsMapper>(),
      ),
    );
    gh.factory<_i865.GetArticlesUseCase>(
      () => _i865.GetArticlesUseCase(gh<_i432.NewsRepository>()),
    );
    gh.factory<_i860.GetSourcesUseCase>(
      () => _i860.GetSourcesUseCase(gh<_i432.NewsRepository>()),
    );
    gh.factory<_i139.NewsTabViewModel>(
      () => _i139.NewsTabViewModel(
        gh<_i860.GetSourcesUseCase>(),
        gh<_i865.GetArticlesUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i148.StorageModule {}

class _$NetworkModule extends _i851.NetworkModule {}
