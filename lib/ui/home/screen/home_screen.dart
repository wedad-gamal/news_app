import 'package:flutter/material.dart';
import 'package:news_app/core/providers/app_config_provider.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/data/apis/api_client.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/ui/home/tabs/home_tab.dart';
import 'package:news_app/ui/home/tabs/news_tab.dart';
import 'package:news_app/ui/home/widgets/home_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        // setState(() {
        //   selectedCategory = null;
        //   ApiClient.instance.resetApi();
        // });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedCategory?.name ?? StringsManager.appTitle,
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
        body: selectedCategory == null
            ? HomeTab(
                onCategorySelected: (Category category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              )
            : NewsTab(category: selectedCategory!),
        drawer: HomeDrawer(
          onHomePress: () {
            // setState(() {
            //   selectedCategory = null;
            //   ApiClient.instance.resetApi();
            // });
          },
        ),
      ),
    );
  }
}
