import 'package:flutter/material.dart';

class AppTheme {
  // text size
  static const double bodyTextSize = 14;
  static const double bottomNavigationBarTextSize = 14;
  static const double smallTextSize = 16;
  static const double normalTextSize = 18;
  static const double largeTextSize = 20;

  // color config
  static const Color accentColor = Colors.amberAccent;
  // normal
  static const Color lightColor = Colors.pink;
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent
    ),
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: bodyTextSize,
        color: lightColor
      ),
      displaySmall: TextStyle(
        fontSize: smallTextSize,
        color: Colors.black87
      ),
      displayMedium: TextStyle(
        fontSize: normalTextSize,
        color: Colors.black87
      ),
      displayLarge: TextStyle(
        fontSize: largeTextSize,
        color: Colors.black87
      )
    )
  );

  // dark theme
  static const Color darkColor = Colors.white;
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: bodyTextSize,
        color: darkColor
      ),
      displaySmall: TextStyle(
        fontSize: smallTextSize
      ),
      displayMedium: TextStyle(
        fontSize: normalTextSize
      ),
      displayLarge: TextStyle(
        fontSize: largeTextSize
      )
    )
  );
}