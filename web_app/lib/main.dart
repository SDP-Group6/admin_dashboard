import 'package:flutter/material.dart';
import 'screens/main_layout.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CleanCaps Admin Panel',
      theme: AppTheme.lightTheme,
      home: const MainLayout(), // Loads MainLayout with Sidebar & TopBar
    );
  }
}
