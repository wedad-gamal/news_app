import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  @preResolve
  Future<SharedPreferences> provideSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
