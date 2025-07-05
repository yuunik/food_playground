import 'package:flutter/cupertino.dart';

import 'package:food_playground/ui/pages/favorite/favorite_page.dart';
import 'package:food_playground/ui/pages/home/home_page.dart';
import 'package:food_playground/ui/pages/main/main_page.dart';

class AppRouter {
  static const initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => const MainPage(),
    HomePage.routeName: (context) => const HomePage(),
    FavoritePage.routeName: (context) => const FavoritePage(),
  };

  static RouteFactory? generateRouter = (settings) {
    return null;
  };

  static RouteFactory? unknownRoute = (settings) {
    return null;
  };
}
