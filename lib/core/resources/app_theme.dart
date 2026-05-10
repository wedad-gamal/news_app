import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

class AppTheme {
  // ─── Font Family ────────────────────────────────────────────────────────────
  static const String _fontFamily = 'Poppins';

  // ─── Text Styles ────────────────────────────────────────────────────────────
  static TextTheme _buildTextTheme({required bool isDark}) {
    final Color primary = isDark
        ? ColorsManager.primaryText
        : ColorsManager.lightPrimaryText;
    final Color secondary = isDark
        ? ColorsManager.secondaryText
        : ColorsManager.lightSecondaryText;
    final Color caption = isDark
        ? ColorsManager.captionText
        : ColorsManager.lightSecondaryText;

    return TextTheme(
      // Display
      displayLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: primary,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
        color: primary,
        letterSpacing: -0.3,
      ),
      displaySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: primary,
      ),

      // Headlines
      headlineLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: primary,
      ),
      headlineMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      headlineSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: primary,
      ),

      // Titles
      titleLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: primary,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: primary,
        letterSpacing: 0.1,
      ),
      titleSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: secondary,
        letterSpacing: 0.1,
      ),

      // Body
      bodyLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: primary,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: secondary,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: caption,
        height: 1.4,
      ),

      // Labels
      labelLarge: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: primary,
        letterSpacing: 0.5,
      ),
      labelMedium: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: secondary,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: caption,
        letterSpacing: 0.5,
      ),
    );
  }

  // ─── Dark Theme ─────────────────────────────────────────────────────────────
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: _fontFamily,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: ColorsManager.primaryText,
        onPrimary: ColorsManager.primaryBackground,
        secondary: ColorsManager.accentSecondary,
        onSecondary: ColorsManager.primaryText,
        surface: ColorsManager.surfaceColor,
        onSurface: ColorsManager.primaryText,
        error: ColorsManager.error,
        onError: ColorsManager.primaryText,
        outline: ColorsManager.borderColor,
        outlineVariant: ColorsManager.dividerColor,
      ),

      // Scaffold
      scaffoldBackgroundColor: ColorsManager.primaryBackground,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.appBarBackground,
        foregroundColor: ColorsManager.primaryText,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManager.iconPrimary, size: 22.r),
        actionsIconTheme: IconThemeData(
          color: ColorsManager.iconPrimary,
          size: 22.r,
        ),
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.primaryText,
          letterSpacing: 0.15,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ColorsManager.bottomNavBackground,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color: ColorsManager.cardBackground,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: const BorderSide(color: ColorsManager.borderColor, width: 0.5),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Tab Bar
      tabBarTheme: TabBarThemeData(
        labelColor: ColorsManager.tabSelected,
        unselectedLabelColor: ColorsManager.tabUnselected,
        indicatorColor: ColorsManager.tabIndicator,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.bottomNavBackground,
        selectedItemColor: ColorsManager.primaryText,
        unselectedItemColor: ColorsManager.iconSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ElevatedButton (View All button)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.viewAllButton,
          foregroundColor: ColorsManager.viewAllButtonText,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: const BorderSide(color: ColorsManager.viewAllButtonBorder),
          ),
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsManager.primaryText,
          side: const BorderSide(color: ColorsManager.borderColor),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorsManager.primaryText,
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input Decoration (Search field, Dropdown)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.surfaceColor,
        hintStyle: TextStyle(
          fontFamily: _fontFamily,
          color: ColorsManager.hintText,
          fontSize: 14.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorsManager.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorsManager.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: ColorsManager.primaryText,
            width: 1.5,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      ),

      // Dropdown
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            ColorsManager.dropdownBackground,
          ),
          elevation: WidgetStatePropertyAll(4),
        ),
        textStyle: TextStyle(
          fontFamily: _fontFamily,
          color: ColorsManager.primaryText,
          fontSize: 14.sp,
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: ColorsManager.dividerColor,
        thickness: 0.5,
        space: 0,
      ),

      // Icon
      iconTheme: IconThemeData(color: ColorsManager.iconPrimary, size: 22.r),

      // Drawer
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorsManager.drawerBackground,
        elevation: 0,
        width: 280.w,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(0)),
        ),
      ),

      // ListTile (used in drawer)
      listTileTheme: ListTileThemeData(
        iconColor: ColorsManager.iconPrimary,
        textColor: ColorsManager.primaryText,
        tileColor: Colors.transparent,
        dense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      ),

      // Chip (category chips)
      chipTheme: ChipThemeData(
        backgroundColor: ColorsManager.surfaceColor,
        selectedColor: ColorsManager.primaryText,
        labelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.primaryText,
        ),
        side: const BorderSide(color: ColorsManager.borderColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      ),

      // Snack Bar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorsManager.surfaceColor,
        contentTextStyle: TextStyle(
          fontFamily: _fontFamily,
          color: ColorsManager.primaryText,
          fontSize: 14.sp,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        behavior: SnackBarBehavior.floating,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsManager.primaryText,
        linearTrackColor: ColorsManager.surfaceColor,
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? ColorsManager.primaryText
              : ColorsManager.iconSecondary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? ColorsManager.accentSecondary
              : ColorsManager.surfaceColor;
        }),
      ),

      // Text Theme
      textTheme: _buildTextTheme(isDark: true),
    );
  }

  // ─── Light Theme ────────────────────────────────────────────────────────────
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: _fontFamily,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: ColorsManager.lightPrimaryText,
        onPrimary: ColorsManager.lightPrimaryBackground,
        secondary: ColorsManager.accentSecondary,
        onSecondary: ColorsManager.lightPrimaryText,
        surface: ColorsManager.lightSecondaryBackground,
        onSurface: ColorsManager.lightPrimaryText,
        error: ColorsManager.error,
        onError: ColorsManager.lightPrimaryBackground,
        outline: ColorsManager.lightDivider,
        outlineVariant: ColorsManager.lightDivider,
      ),

      // Scaffold
      scaffoldBackgroundColor: ColorsManager.lightPrimaryBackground,

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.lightAppBarBackground,
        foregroundColor: ColorsManager.lightPrimaryText,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsManager.lightIconPrimary,
          size: 22.r,
        ),
        actionsIconTheme: IconThemeData(
          color: ColorsManager.lightIconPrimary,
          size: 22.r,
        ),
        titleTextStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.lightPrimaryText,
          letterSpacing: 0.15,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: ColorsManager.lightAppBarBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color: ColorsManager.lightCardBackground,
        elevation: 1,
        margin: EdgeInsets.zero,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Tab Bar
      tabBarTheme: TabBarThemeData(
        labelColor: ColorsManager.lightPrimaryText,
        unselectedLabelColor: ColorsManager.lightSecondaryText,
        indicatorColor: ColorsManager.lightPrimaryText,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.lightPrimaryText,
          foregroundColor: ColorsManager.lightPrimaryBackground,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // OutlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsManager.lightPrimaryText,
          side: const BorderSide(color: ColorsManager.lightDivider),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorsManager.lightPrimaryText,
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.lightSurfaceColor,
        hintStyle: TextStyle(
          fontFamily: _fontFamily,
          color: ColorsManager.lightSecondaryText.withAlpha(150),
          fontSize: 14.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorsManager.lightDivider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: ColorsManager.lightDivider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: ColorsManager.lightPrimaryText,
            width: 1.5,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      ),

      // Dropdown
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: const MenuStyle(
          backgroundColor: WidgetStatePropertyAll(
            ColorsManager.lightDropdownBackground,
          ),
          elevation: WidgetStatePropertyAll(4),
        ),
        textStyle: TextStyle(
          fontFamily: _fontFamily,
          color: ColorsManager.lightPrimaryText,
          fontSize: 14.sp,
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: ColorsManager.lightDivider,
        thickness: 0.5,
        space: 0,
      ),

      // Icon
      iconTheme: IconThemeData(
        color: ColorsManager.lightIconPrimary,
        size: 22.r,
      ),

      // Drawer
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorsManager.lightSecondaryBackground,
        elevation: 2,
        width: 280.w,
      ),

      // ListTile
      listTileTheme: ListTileThemeData(
        iconColor: ColorsManager.lightIconPrimary,
        textColor: ColorsManager.lightPrimaryText,
        tileColor: Colors.transparent,
        dense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      ),

      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: ColorsManager.lightSurfaceColor,
        selectedColor: ColorsManager.lightPrimaryText,
        labelStyle: TextStyle(
          fontFamily: _fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.lightPrimaryText,
        ),
        side: const BorderSide(color: ColorsManager.lightDivider),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      ),

      // Snack Bar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorsManager.lightSurfaceColor,
        contentTextStyle: TextStyle(
          fontFamily: _fontFamily,
          color: ColorsManager.lightPrimaryText,
          fontSize: 14.sp,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        behavior: SnackBarBehavior.floating,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsManager.lightPrimaryText,
        linearTrackColor: ColorsManager.lightSurfaceColor,
      ),

      // Switch
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? ColorsManager.lightPrimaryText
              : ColorsManager.lightSecondaryText;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? ColorsManager.accentSecondary
              : ColorsManager.lightSurfaceColor;
        }),
      ),

      // Text Theme
      textTheme: _buildTextTheme(isDark: false),
    );
  }

  AppTheme._();
}
