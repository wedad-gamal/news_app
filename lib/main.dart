import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/core/providers/app_config_provider.dart';
import 'package:news_app/core/resources/app_theme.dart';
import 'package:news_app/presentation/home/screen/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // 1. Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  // 2. Load the .env file
  await dotenv.load(fileName: ".env");

  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return ChangeNotifierProvider(
          create: (_) => AppConfigProvider(),
          child: Consumer<AppConfigProvider>(
            builder: (context, appProvider, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: appProvider.isDark ? ThemeMode.dark : ThemeMode.light,
              home: HomeScreen(),
            ),
          ),
        );
      },
    );
  }
}
