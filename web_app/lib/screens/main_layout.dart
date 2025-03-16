import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';
import 'dashboard_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // Default selected page & title
  Widget _selectedPage = const DashboardScreen();
  String _pageTitle = "Dashboard";

  // Function to navigate between screens and update the title
  void _navigateTo(Widget page, String title) {
    setState(() {
      _selectedPage = page;
      _pageTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(onItemSelected: _navigateTo), // Sidebar for navigation
          Expanded(
            flex: 4,
            child: Column(
              children: [
                TopBar(title: _pageTitle), // Dynamic Top Bar Title
                Expanded(
                  child: _selectedPage, // Dynamic Page Content
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
