import 'package:flutter/material.dart';
import 'package:food_playground/ui/pages/detail/meal_detail_page.dart';
import 'package:food_playground/ui/pages/favorite/favorite_page.dart';
import 'package:food_playground/ui/pages/home/home_page.dart';
import 'package:food_playground/ui/pages/main/main.dart';
import 'package:food_playground/ui/pages/meal/meal_page.dart';

class AppRouter {
  // default route
  static const String initialRoute = MainPage.routeName;

  // routes
  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => const MainPage(),
    HomePage.routeName: (context) => const HomePage(),
    FavoritePage.routeName: (context) => const FavoritePage(),
    MealPage.routeName: (context) => const MealPage(),
    MealDetailPage.routeName: (context) => const MealDetailPage()
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