import 'package:flutter/material.dart';

class AssetsManager {
  static const String _darkPath = 'assets/dark';
  static const String _lightPath = 'assets/light';
  static const String _iconsPath = 'assets/icons';
  static const String _lottiePath = 'assets/lottie';
  static const String _imagesPath = 'assets/images';

  // ─── Theme-aware Category Images (with BuildContext) ────────────────────────
  // Use inside widgets:  AssetsManager.categoryGeneral(context)

  static String categoryGeneral(BuildContext context) =>
      _themed(context, 'general.png');

  static String categoryBusiness(BuildContext context) =>
      _themed(context, 'busniess.png');

  static String categorySport(BuildContext context) =>
      _themed(context, 'sport.png');

  static String categoryTechnology(BuildContext context) =>
      _themed(context, 'technology.png');

  static String categoryHealth(BuildContext context) =>
      _themed(context, 'helth.png');

  static String categoryEntertainment(BuildContext context) =>
      _themed(context, 'entertainment.png');

  static String categoryScience(BuildContext context) =>
      _themed(context, 'science.png');

  // ─── Theme-aware Category Images (without BuildContext) ─────────────────────
  // Use inside cubits / mappers:  AssetsManager.categoryGeneralByMode(isDark: true)

  static String categoryGeneralByMode({required bool isDark}) =>
      _themedByMode(isDark, 'general.png');

  static String categoryBusinessByMode({required bool isDark}) =>
      _themedByMode(isDark, 'busniess.png');

  static String categorySportByMode({required bool isDark}) =>
      _themedByMode(isDark, 'sport.png');

  static String categoryTechnologyByMode({required bool isDark}) =>
      _themedByMode(isDark, 'technology.png');

  static String categoryHealthByMode({required bool isDark}) =>
      _themedByMode(isDark, 'helth.png');

  static String categoryEntertainmentByMode({required bool isDark}) =>
      _themedByMode(isDark, 'entertainment.png');

  static String categoryScienceByMode({required bool isDark}) =>
      _themedByMode(isDark, 'science.png');

  // ─── App Logo & Branding ────────────────────────────────────────────────────
  static const String appLogo = '$_imagesPath/app_logo.png';
  static const String splashLogo = '$_imagesPath/splash_logo.png';
  static const String routeLogo = '$_imagesPath/route_logo.png';

  // ─── Placeholder / Fallback ─────────────────────────────────────────────────
  static const String imagePlaceholder = '$_imagesPath/placeholder.png';
  static const String avatarPlaceholder = '$_imagesPath/avatar_placeholder.png';

  // ─── Icons ──────────────────────────────────────────────────────────────────
  static const String iconSearch = '$_iconsPath/ic_search.svg';
  static const String iconMenu = '$_iconsPath/ic_menu.svg';
  static const String iconBack = '$_iconsPath/ic_back.svg';
  static const String iconShare = '$_iconsPath/ic_share.svg';
  static const String iconBookmark = '$_iconsPath/ic_bookmark.svg';
  static const String iconBookmarkFilled = '$_iconsPath/ic_bookmark_filled.svg';
  static const String iconHome = '$_iconsPath/ic_home.svg';
  static const String iconSettings = '$_iconsPath/ic_settings.svg';
  static const String iconLanguage = '$_iconsPath/ic_language.svg';
  static const String iconTheme = '$_iconsPath/ic_theme.svg';
  static const String iconArrowRight = '$_iconsPath/ic_arrow_right.svg';
  static const String iconDropdown = '$_iconsPath/ic_dropdown.svg';

  // ─── Lottie Animations ──────────────────────────────────────────────────────
  static const String loadingAnimation = '$_lottiePath/loading.json';
  static const String errorAnimation = '$_lottiePath/error.json';
  static const String emptyAnimation = '$_lottiePath/empty.json';
  static const String noInternetAnimation = '$_lottiePath/no_internet.json';

  // ─── Private Helpers ────────────────────────────────────────────────────────
  static String _themed(BuildContext context, String filename) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? '$_darkPath/$filename' : '$_lightPath/$filename';
  }

  static String _themedByMode(bool isDark, String filename) =>
      isDark ? '$_darkPath/$filename' : '$_lightPath/$filename';

  AssetsManager._();
}
