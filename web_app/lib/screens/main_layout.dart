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
    final theme = Theme.of(context); // Access the theme

    // Extract border color from theme, fallback to black if not set
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // Themed background
      body: Row(
        children: [
          Sidebar(onItemSelected: _navigateTo), // Sidebar for navigation
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.cardTheme.color, // Themed background
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: borderColor,
                      width: 2,
                    ), // Themed border
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.05),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(16.0),
                  child: TopBar(
                    title: _pageTitle,
                  ), // Top Bar inside bordered container
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color, // Themed background
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: borderColor,
                        width: 2,
                      ), // Themed border
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(
                      12.0,
                    ), // Adds spacing around the content
                    padding: const EdgeInsets.all(
                      16.0,
                    ), // Standard padding inside
                    child: _selectedPage, // Dynamic Page Content
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
