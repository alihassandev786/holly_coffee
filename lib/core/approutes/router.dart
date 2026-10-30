import 'package:flutter/material.dart';
import 'package:hollycoffee/presentation/bottomnavigation/home.dart';
import 'package:hollycoffee/presentation/bottomnavigation/menu.dart';
import 'package:hollycoffee/presentation/bottomnavigation/homeroutes.dart';

class AppRouter {
  AppRouter._();
  static const String homeroutes = "/";
  static const String home = "home";
  static const String category = "category";
  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case home:
        return MaterialPageRoute(settings: setting, builder: (_) => Home());
        case homeroutes:
        return MaterialPageRoute(builder: (_)=>Homeroutes());
        case category:
        return MaterialPageRoute(builder: (_)=>Menu());
        default: 
        return null;
    }
  }
}
