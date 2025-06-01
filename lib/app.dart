import 'package:flutter/material.dart';

import 'package:food_playground/core/router/app_router.dart';
import 'package:food_playground/ui/shared/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Court',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: AppRouter.routes,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
      onUnknownRoute: AppRouter.anyRoute,
    );
  }
}