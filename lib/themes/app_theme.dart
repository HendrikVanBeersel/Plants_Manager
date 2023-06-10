import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme() {
    return ThemeData(
        // Define your dark theme properties here
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff358856)),
        scaffoldBackgroundColor: const Color(0xff62BD69)
        // ...
        );
  }
}
