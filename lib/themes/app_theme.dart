import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      // Define your theme properties here
      primarySwatch: Colors.blue,
      // ...
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      // Define your dark theme properties here
      primarySwatch: Colors.indigo,
      // ...
    );
  }
}