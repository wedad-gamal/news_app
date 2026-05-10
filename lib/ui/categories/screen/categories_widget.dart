import 'package:flutter/material.dart';
import 'package:news_app/core/resources/strings_manager.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringsManager.homeGreeting,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
