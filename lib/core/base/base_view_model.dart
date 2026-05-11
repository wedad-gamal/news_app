import 'package:flutter/material.dart';

abstract class BaseNavigator {}

abstract class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;
}
