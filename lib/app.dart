import 'package:flutter/material.dart';
import 'package:food_playground/core/router/app_router.dart';
import 'package:food_playground/ui/shared/app_theme.dart';
import 'package:food_playground/ui/shared/screen_fit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenFit.initialize(context);
    return MaterialApp(
      title: "Food Playground",
      theme: AppTheme.normalTheme,
      darkTheme: AppTheme.darkTheme,
      routes: AppRouter.routes,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRouter,
      onUnknownRoute: AppRouter.unknownRoute,
    );
  }
}
