import 'package:flutter/material.dart';
import 'package:news_app/core/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

extension ContextExtensions on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get texts => Theme.of(this).textTheme;
  AppConfigProvider get appConfig => Provider.of<AppConfigProvider>(this);
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension WhiteSpace on num {
  SizedBox get verticalSpace => SizedBox(height: toDouble());
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}

extension PaddingExtension on Widget {
  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddingVertical(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingSymmetric({
    required double horizontal,
    required double vertical,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Widget paddingOnly({
    required double top,
    required double bottom,
    required double left,
    required double right,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
      ),
      child: this,
    );
  }
}

extension StringExtension on String {
  String getImagePath(BuildContext context) =>
      "assets/images/${Theme.of(context).brightness == Brightness.light ? "light" : "dark"}/$this";
}
