import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/rooms_screen.dart';
import '../screens/documents_screen.dart';
import '../screens/settings_screen.dart';

class Sidebar extends StatelessWidget {
  final Function(Widget, String) onItemSelected;

  const Sidebar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CleanCaps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          SidebarItem(
            title: "Dashboard",
            icon: Icons.dashboard,
            onTap: () => onItemSelected(const DashboardScreen(), "Dashboard"),
          ),
          SidebarItem(
            title: "Rooms",
            icon: Icons.room,
            onTap: () => onItemSelected(const RoomsScreen(), "Rooms"),
          ),
          SidebarItem(
            title: "Documents",
            icon: Icons.folder,
            onTap: () => onItemSelected(const DocumentsScreen(), "Documents"),
          ),
          SidebarItem(
            title: "Settings",
            icon: Icons.settings,
            onTap: () => onItemSelected(const SettingsScreen(), "Settings"),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // Ensures ripple effect blends with background
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.blue.withOpacity(0.3),
        highlightColor: Colors.blue.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Icon(icon, size: 24),
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
