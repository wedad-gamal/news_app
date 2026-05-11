import 'package:flutter/material.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/presentation/home/home_screen_navigator.dart';
import 'package:news_app/presentation/home/models/selected_tab.dart';

class HomeViewModel extends ChangeNotifier {
  Category? selectedCategory;
  String appBarTitle = "home";
  SelectedTab selectedTab = SelectedTab.home;
  HomeScreenNavigator? navigator;

  void changeSelectedCategory(Category? category) {
    selectedCategory = category;
    appBarTitle = category?.name ?? "home";
    if (category == null) {
      selectedTab = SelectedTab.home;
      navigator?.closeDrawer();
    } else {
      selectedTab = SelectedTab.news;
    }
    notifyListeners();
  }

  void reset() {
    selectedCategory = null;
    appBarTitle = "home";
    notifyListeners();
  }
}
