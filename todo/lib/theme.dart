import 'package:flutter/material.dart';

class TodoAppTheme {
  static ThemeData get light {
    return ThemeData(
        appBarTheme: AppBarTheme(color: Colors.lightBlue),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
        snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating));
  }

  static ThemeData get dark {
    return ThemeData(
        appBarTheme: AppBarTheme(color: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating));
  }
}
