import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue, // Deprecated in Material3 but kept for reference
    useMaterial3: true, // Enables Material 3 design

    scaffoldBackgroundColor: Colors.grey[200],

    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Replaces headline6
      bodyLarge: TextStyle(fontSize: 16), // Replaces bodyText1
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Primary button color
        foregroundColor: Colors.white, // Text color
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      shadowColor: Colors.black12, // Ensures consistent shadow effect
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white, // Title & icon colors
      elevation: 0,
      centerTitle: true,
    ),

    dividerTheme: const DividerThemeData(
      thickness: 1.2,
      color: Colors.black12,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue),
      ),
    ),
  );
}
