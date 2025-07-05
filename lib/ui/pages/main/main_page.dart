import 'package:flutter/material.dart';

import 'package:food_playground/ui/pages/main/initialize_items.dart';

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
        onTap: (val) => setState(() {
          _currentIndex = val;
        }),
        items: bottomNavigationBarList,
      ),
    );
  }
}
