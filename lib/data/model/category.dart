import 'package:news_app/core/resources/strings_manager.dart';

class Category {
  String id;
  String name;
  String image;

  Category({required this.id, required this.name, required this.image});
}

List<Category> categories = [
  Category(
    id: "general",
    name: StringsManager.categoryGeneral,
    image: "general.png",
  ),
  Category(
    id: "business",
    name: StringsManager.categoryBusiness,
    image: "busniess.png",
  ),
  Category(
    id: "sports",
    name: StringsManager.categorySports,
    image: "sport.png",
  ),
  Category(
    id: "technology",
    name: StringsManager.categoryTechnology,
    image: "technology.png",
  ),
  Category(
    id: "entertainment",
    name: StringsManager.categoryEntertainment,
    image: "entertainment.png",
  ),
  Category(
    id: "health",
    name: StringsManager.categoryHealth,
    image: "helth.png",
  ),
  Category(
    id: "science",
    name: StringsManager.categoryScience,
    image: "science.png",
  ),
];
