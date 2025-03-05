import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CleanCaps Admin Panel',
      theme: AppTheme.lightTheme, // Apply custom theme
      home: DashboardScreen(),
    );
  }
}
