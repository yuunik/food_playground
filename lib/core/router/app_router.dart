import 'package:flutter/cupertino.dart';

import 'package:food_playground/ui/pages/main/main_page.dart';
import 'package:food_playground/ui/pages/meal/meal_page.dart';

class AppRouter {
  static const initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => const MainPage(),
    MealPage.routeName: (context) => const MealPage()
  };

  static RouteFactory? generateRouter = (settings) {
    return null;
  };

  static RouteFactory? unknownRoute = (settings) {
    return null;
  };
}
