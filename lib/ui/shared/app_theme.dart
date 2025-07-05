// app theme configuration
import 'package:flutter/material.dart';

class AppTheme {
  static const double bodyTextSize = 14.0;
  static const double bottomNavigationBarTextSize = 12.0;
  static const double smallTextSize = 12.0;
  static const double normalTextSize = 16.0;
  static const double largeTextSize = 20.0;

  static final Color accentColor = Colors.amber;

  // normal theme
  static const Color normalTextColor = Colors.black87;
  static final ThemeData normalTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: bodyTextSize, color: normalTextColor),
      displaySmall: TextStyle(fontSize: smallTextSize, color: normalTextColor),
      displayMedium: TextStyle(
        fontSize: normalTextSize,
        color: normalTextColor,
      ),
      displayLarge: TextStyle(fontSize: largeTextSize, color: normalTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: normalTextColor,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: normalTextColor
      ),
      centerTitle: true
    )
  );

  // dark mode
  static const Color darkTextColor = Colors.white70;
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurpleAccent,
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: bodyTextSize, color: darkTextColor),
      displaySmall: TextStyle(fontSize: smallTextSize, color: darkTextColor),
      displayMedium: TextStyle(fontSize: normalTextSize, color: darkTextColor),
      displayLarge: TextStyle(fontSize: largeTextSize, color: darkTextColor),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurpleAccent,
      foregroundColor: darkTextColor,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkTextColor
      ),
      centerTitle: true
    )
  );
}
