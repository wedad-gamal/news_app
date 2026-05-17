import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/base/base_view.dart';
import 'package:news_app/core/di/di.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/core/utilies/extensions.dart';
import 'package:news_app/data/apis/api_client.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/data_source/implementation/news_remote_data_source.dart';
import 'package:news_app/data/mapper/news_mapper.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/use_case/get_articles_use_case.dart';
import 'package:news_app/domain/use_case/get_sources_use_case.dart';
import 'package:news_app/presentation/home/home_view_model.dart';
import 'package:news_app/presentation/home/tabs/news_tab/news_tab_view_model.dart';
import 'package:news_app/presentation/home/widgets/articles/news_list.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});
  final Category category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends BaseView<NewsTab, NewsTabViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.category = widget.category;
    viewModel.getSources();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<NewsTabViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.newsIsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (viewModel.newsErrorMessage.isNotEmpty) {
            return Center(child: Text(viewModel.newsErrorMessage));
          }
          if (viewModel.sources.isEmpty) {
            return Center(child: Text(StringsManager.noSourcesFound));
          }
          return NewsList();
        },
      ),
    );

    // FutureBuilder(
    //   future: RetrofitService.instance.getSources(category: widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Theme.of(context).primaryColor,
    //         ),
    //       );
    //     }
    //     if (snapshot.hasError) {
    //       return Center(child: Text(snapshot.error.toString()));
    //     }

    //     return NewsList(sources: snapshot.data?.sources ?? []);
    //   },
    // );
  }

  @override
  NewsTabViewModel createViewModel() {
    return getIt<NewsTabViewModel>();
  }
}
