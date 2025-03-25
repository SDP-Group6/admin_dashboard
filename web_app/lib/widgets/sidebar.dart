import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/rooms_screen.dart';
import '../screens/documents_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/jobs_screen.dart';

class Sidebar extends StatelessWidget {
  final Function(Widget, String) onItemSelected;

  const Sidebar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Extract border color from theme, fallback to black if not set
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CleanCaps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          _sidebarItemContainer(
            child: SidebarItem(
              title: "Dashboard",
              icon: Icons.dashboard,
              onTap: () => onItemSelected(const DashboardScreen(), "Dashboard"),
              borderColor: borderColor,
            ),
          ),
          _sidebarItemContainer(
            child: SidebarItem(
              title: "Rooms",
              icon: Icons.room,
              onTap: () => onItemSelected(const RoomsScreen(), "Rooms"),
              borderColor: borderColor,
            ),
          ),
          _sidebarItemContainer(
            child: SidebarItem(
              title: "Scheduled Jobs",
              icon: Icons.schedule,
              onTap: () => onItemSelected(const JobsScreen(), "Scheduled Jobs"),
              borderColor: borderColor,
            ),
          ),
          _sidebarItemContainer(
            child: SidebarItem(
              title: "Documents",
              icon: Icons.folder,
              onTap: () => onItemSelected(const DocumentsScreen(), "Documents"),
              borderColor: borderColor,
            ),
          ),
          _sidebarItemContainer(
            child: SidebarItem(
              title: "Settings",
              icon: Icons.settings,
              onTap: () => onItemSelected(const SettingsScreen(), "Settings"),
              borderColor: borderColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sidebarItemContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(228, 210, 249, 1),
            Color.fromARGB(255, 229, 233, 250),
          ],
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      child: child,
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color borderColor;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
