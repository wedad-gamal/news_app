import 'package:flutter/material.dart';

class ColorsManager {
  // Primary Backgrounds
  static const Color primaryBackground = Color(0xFF171717);
  static const Color secondaryBackground = Color(0xFF171717);
  static const Color cardBackground = Color(0xFF171717);
  static const Color surfaceColor = Color(0xFF242424);

  // App Bar & Navigation
  static const Color appBarBackground = Color(0xFF171717);
  static const Color bottomNavBackground = Color(0xFF171717);

  // Category Tabs
  static const Color tabSelected = Color(0xFFFFFFFF);
  static const Color tabUnselected = Color(0xFF888888);
  static const Color tabIndicator = Color(0xFFFFFFFF);

  // Text Colors
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFB0B0B0);
  static const Color hintText = Color(0xFF666666);
  static const Color captionText = Color(0xFF888888);

  // Accent Colors
  static const Color accentPrimary = Color(0xFFE8E8E8);
  static const Color accentSecondary = Color(0xFF555555);

  // Button Colors
  static const Color viewAllButton = Color(0xFF2A2A2A);
  static const Color viewAllButtonText = Color(0xFFFFFFFF);
  static const Color viewAllButtonBorder = Color(0xFF3A3A3A);

  // Category Card Colors
  static const Color categoryCardOverlay = Color(
    0xCC000000,
  ); // 80% opacity black
  static const Color categoryLabelBackground = Color(0x99000000); // 60% opacity

  // Settings / Drawer
  static const Color drawerBackground = Color(0xFF171717);
  static const Color drawerItemBackground = Color(0xFF171717);
  static const Color drawerDivider = Color(0xFF2A2A2A);
  static const Color dropdownBackground = Color(0xFF2A2A2A);
  static const Color dropdownBorder = Color(0xFF3A3A3A);

  // Dividers & Borders
  static const Color dividerColor = Color(0xFF2A2A2A);
  static const Color borderColor = Color(0xFF333333);
  static const Color shimmerBase = Color(0xFF1E1E1E);
  static const Color shimmerHighlight = Color(0xFF2A2A2A);

  // Icons
  static const Color iconPrimary = Color(0xFFFFFFFF);
  static const Color iconSecondary = Color(0xFF888888);

  // Status Colors
  static const Color error = Color(0xFFCF6679);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);

  // Light Theme Overrides (for theme toggle)
  static const Color lightPrimaryBackground = Color(0xFFF5F5F5);
  static const Color lightSecondaryBackground = Color(0xFFFFFFFF);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color lightSurfaceColor = Color(0xFFEEEEEE);
  static const Color lightPrimaryText = Colors.black;
  static const Color lightSecondaryText = Color(0xFF555555);
  static const Color lightAppBarBackground = Color(0xFFF5F5F5);
  static const Color lightDivider = Color(0xFFE0E0E0);
  static const Color lightIconPrimary = Color(0xFF111111);
  static const Color lightDropdownBackground = Color(0xFFFFFFFF);
  static const Color lightDropdownBorder = Color(0xFFCCCCCC);

  // Splash Screen
  static const Color splashBackground = Color(0xFF0D0D0D);
  static const Color splashIconColor = Color(0xFFFFFFFF);

  ColorsManager._();
}
