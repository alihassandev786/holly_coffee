import 'package:flutter/material.dart';
import 'package:hollycoffee/core/approutes/router.dart';
import 'package:hollycoffee/core/apptheme/apptheme.dart';
import 'package:hollycoffee/core/utils/shared_pref.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.loadthememode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: SharedPref.themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.homeroutes,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: Apptheme.lightTheme,
          darkTheme: Apptheme.darkTheme,
          themeMode: themeMode,
        );
      },
    );
  }
}
