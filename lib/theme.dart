import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData greenTheme = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green[800],
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.green[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}