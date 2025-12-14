import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_09_router_P17/page/about/app_about_page.dart';
import 'package:food_playground/flutter_learner/_09_router_P17/page/detail/app_detail_page.dart';
import 'package:food_playground/flutter_learner/_09_router_P17/page/unknown/app_unknown_page.dart';

import 'package:food_playground/main.dart';

class AppRouterConfig {
  const AppRouterConfig._();

  // 路由表
  static Map<String, WidgetBuilder> routes = {
    AppHomepage.routeName: (BuildContext context) => AppHomepage(),
    AppAboutPage.routeName: (BuildContext context) => AppAboutPage(),
  };

  // 初始化路由
  static String initialRoute = AppHomepage.routeName;

  // 路由生成器
  static RouteFactory? onGenerateRoute = (RouteSettings settings) {
    if (settings.name == AppDetailPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) =>
            AppDetailPage(msg: settings.arguments as String),
      );
    }
    return null;
  };

  // 未知路由
  static RouteFactory? onUnknownRoute = (RouteSettings settings) =>
      MaterialPageRoute(builder: (BuildContext context) => AppUnknownPage());
}
