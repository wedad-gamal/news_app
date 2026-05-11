import 'package:flutter/material.dart';
import 'package:news_app/core/base/base_view.dart';
import 'package:news_app/core/providers/app_config_provider.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/data/apis/api_client.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/presentation/home/home_screen_navigator.dart';
import 'package:news_app/presentation/home/home_view_model.dart';
import 'package:news_app/presentation/home/models/selected_tab.dart';
import 'package:news_app/presentation/home/tabs/home_tab.dart';
import 'package:news_app/presentation/home/tabs/news_tab/news_tab.dart';
import 'package:news_app/presentation/home/widgets/home_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeScreenNavigator {
  @override
  void closeDrawer() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return PopScope(
            onPopInvokedWithResult: (didPop, result) {
              viewModel.changeSelectedCategory(null);
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  viewModel.appBarTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  provider.changeTheme(
                    provider.isDark ? ThemeMode.light : ThemeMode.dark,
                  );
                },
                child: Icon(Icons.change_circle),
              ),
              body: switch (viewModel.selectedTab) {
                SelectedTab.home => HomeTab(
                  onCategorySelected: (Category category) {
                    viewModel.changeSelectedCategory(category);
                  },
                ),

                SelectedTab.news => NewsTab(
                  category: viewModel.selectedCategory!,
                ),
              },
              drawer: HomeDrawer(
                onHomePress: () {
                  viewModel.changeSelectedCategory(null);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  HomeViewModel createViewModel() {
    return HomeViewModel();
  }
}
