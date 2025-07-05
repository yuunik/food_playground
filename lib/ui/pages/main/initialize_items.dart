import 'package:flutter/material.dart';

import 'package:food_playground/ui/pages/favorite/favorite_page.dart';
import 'package:food_playground/ui/pages/home/home_page.dart';

// page list
List<Widget> pageList = [
  const HomePage(),
  const FavoritePage()
];

// bottomNavigationBar list
List<BottomNavigationBarItem> bottomNavigationBarList = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Homepage',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'Favorite',
  )
];