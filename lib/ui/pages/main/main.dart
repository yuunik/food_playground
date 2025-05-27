import 'package:flutter/material.dart';
import 'package:food_playground/ui/shared/app_theme.dart';
import 'package:food_playground/ui/pages/main/initialize_list.dart';
import 'package:food_playground/ui/shared/size_fit.dart';

class MainPage extends StatefulWidget {
  // router name
  static const String routeName = '/';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: AppTheme.bottomNavigationBarTextSize,
        unselectedFontSize: AppTheme.bottomNavigationBarTextSize,
        selectedItemColor: const Color.fromRGBO(53, 116, 240, 1),
        items: bottomNavigationList,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
