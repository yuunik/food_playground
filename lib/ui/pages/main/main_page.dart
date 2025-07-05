import 'package:flutter/material.dart';

import 'package:food_playground/ui/pages/main/initialize_items.dart';
import 'package:food_playground/ui/shared/app_theme.dart';

class MainPage extends StatefulWidget {
  static const String routeName = "/";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pageList),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: AppTheme.bodyTextSize,
        unselectedFontSize: AppTheme.bodyTextSize,
        onTap: (val) => setState(() {
          _currentIndex = val;
        }),
        items: bottomNavigationBarList,
      ),
    );
  }
}
