import 'package:flutter/material.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/core/utilies/extensions.dart';
import 'package:news_app/data/model/category.dart';

class HomeTab extends StatelessWidget {
  final Function(Category) onCategorySelected;
  const HomeTab({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          onCategorySelected(categories[index]);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
              child: Image.asset(categories[index].image.getImagePath(context)),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  index % 2 == 0
                      ? Expanded(child: 0.horizontalSpace)
                      : 0.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .spaceAround,

                      children: [
                        Text(
                          categories[index].name,
                          style: context.texts.titleLarge?.copyWith(
                            color: context.colors.onPrimary,
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colors.surface.withAlpha(80),
                              borderRadius: BorderRadiusGeometry.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                index % 2 == 0
                                    ? 0.horizontalSpace
                                    : Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context.colors.surface,
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 32,
                                          color: context.colors.primary,
                                        ),
                                      ),
                                Text(
                                  StringsManager.viewAll,
                                  style: context.texts.titleLarge,
                                ).paddingAll(16),
                                index % 2 != 0
                                    ? 0.horizontalSpace
                                    : Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context.colors.surface,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 32,
                                          color: context.colors.primary,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ).paddingVertical(24).paddingHorizontal(8),
                      ],
                    ),
                  ),
                  index % 2 != 0
                      ? Expanded(child: 0.horizontalSpace)
                      : 0.horizontalSpace,
                ],
              ),
            ),
          ],
        ).paddingAll(10),
      ),
      separatorBuilder: (_, _) => 16.verticalSpace,
      itemCount: categories.length,
    );
  }
}
