import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFB3CDE0), // Light pastel blue

    useMaterial3: true,

    scaffoldBackgroundColor: const Color(0xFFF7F7F7), // Soft off-white

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5D5D5D),
      ), // Dark pastel gray
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF5D5D5D),
      ), // Consistent text color
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB3CDE0), // Pastel blue button
        foregroundColor: Color(0xFF354F52), // Dark text color
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    cardTheme: CardTheme(
      color: const Color(0xFFFAFAFA), // Light pastel gray background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Colors.black,
          width: 2,
        ), // **Dark black border**
      ),
      elevation: 3,
      shadowColor: Colors.black12, // Ensures consistent shadow effect
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFB3CDE0), // Pastel blue
      foregroundColor: Colors.white, // White text/icons
      elevation: 0,
      centerTitle: true,
    ),

    dividerTheme: const DividerThemeData(thickness: 1.2, color: Colors.black12),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFFFFFFF), // White input fields
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
        borderSide: const BorderSide(
          color: Color(0xFFB3CDE0),
        ), // Themed focus color
      ),
    ),
  );
}
