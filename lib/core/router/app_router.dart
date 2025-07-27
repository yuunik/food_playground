import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_playground/ui/pages/main/main_page.dart';
import 'package:food_playground/ui/pages/meal/meal_page.dart';
import 'package:food_playground/core/model/category_model.dart';

class AppRouter {
  static const initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => const MainPage(),
  };

  static RouteFactory? generateRouter = (settings) {
    switch (settings.name) {
      case MealPage.routeName:
        final category = settings.arguments as CategoryModel?;
        if (category != null) {
          return MaterialPageRoute(
            builder: (context) => const MealPage(),
            settings: settings,
          );
        }
        return null;
      default:
        return null;
    }
  };

  static RouteFactory? unknownRoute = (settings) {
    return null;
  };
}
