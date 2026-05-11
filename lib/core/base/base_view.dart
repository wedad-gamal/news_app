import 'package:flutter/material.dart';
import 'package:news_app/core/base/base_view_model.dart';

abstract class BaseView<S extends StatefulWidget, VM extends BaseViewModel>
    extends State<S>
    implements BaseNavigator {
  late VM viewModel;

  VM createViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = createViewModel();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    viewModel.navigator = null;
    super.dispose();
  }
}
