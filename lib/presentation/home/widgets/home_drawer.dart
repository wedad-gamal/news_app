import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/resources/assets_manager.dart';
import 'package:news_app/core/resources/colors_manager.dart';
import 'package:news_app/core/resources/strings_manager.dart';
import 'package:news_app/core/utilies/extensions.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onHomePress;
  const HomeDrawer({super.key, required this.onHomePress});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colors.primary,
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: ColorsManager.accentPrimary),
              child: Center(
                child: Text(
                  StringsManager.appName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorsManager.lightPrimaryText,
                  ),
                ),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    onHomePress();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.iconHome,
                        height: 16,
                        width: 16,
                      ),
                      16.horizontalSpace,
                      Text(
                        StringsManager.settingsGoToHome,
                        style: context.texts.titleMedium?.copyWith(
                          color: context.colors.surface,
                        ),
                      ),
                    ],
                  ).paddingHorizontal(16).paddingVertical(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
