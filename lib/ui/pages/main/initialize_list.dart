import 'package:flutter/material.dart';
import 'package:food_playground/ui/pages/favorite/FavoritePage.dart';
import 'package:food_playground/ui/pages/home/HomePage.dart';

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