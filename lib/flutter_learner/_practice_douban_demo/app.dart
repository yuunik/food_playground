import 'package:flutter/material.dart';

import 'package:food_playground/flutter_learner/_practice_douban_demo/ui/pages/main/main_page.dart';

class DouBanApp extends StatelessWidget {
  const DouBanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.green.shade400,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.green.shade400,
        ),
      ),
    );
  }
}
