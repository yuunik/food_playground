import 'package:flutter/material.dart';
import 'package:food_playground/ui/pages/favorite/FavoritePage.dart';
import 'package:food_playground/ui/pages/home/HomePage.dart';
import 'package:food_playground/ui/pages/main/main.dart';

class AppRouter {
  // default route
  static const String initialRoute = MainPage.routeName;

  // routes
  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => const MainPage(),
    HomePage.routeName: (context) => const HomePage(),
    FavoritePage.routeName: (context) => const FavoritePage()
  };

  // generate route
  static RouteFactory? generateRoute = (setting) {
    return null;
  };

  // any route
  static RouteFactory? anyRoute = (setting) {
    return null;
  };
}