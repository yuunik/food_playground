import 'package:flutter/material.dart';
import 'package:food_playground/ui/pages/favorite/favorite_page.dart';
import 'package:food_playground/ui/pages/home/home_page.dart';

// page list
List<Widget> pageList = <Widget>[
  const HomePage(),
  const FavoritePage()
];

// bottomBar List
List<BottomNavigationBarItem> bottomNavigationList = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "HomePage"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
];