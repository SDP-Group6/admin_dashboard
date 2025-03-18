import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title; // Dynamic title

  const TopBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme properties

    // Extract border color from theme, fallback to black if not set
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardTheme.color, // Use themed background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2), // Apply black border
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dynamic Title
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // Action Buttons using TopBarItem
          Row(
            children: [
              TopBarItem(
                icon: Icons.notifications,
                tooltip: "Notifications",
                onTap:
                    () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Notifications Clicked")),
                    ),
                borderColor: borderColor,
              ),
              const SizedBox(width: 20),
              TopBarItem(
                icon: Icons.person,
                tooltip: "Profile",
                onTap:
                    () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile Clicked")),
                    ),
                borderColor: borderColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopBarItem extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color borderColor;

  const TopBarItem({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2), // Apply black border
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color:
            Colors.transparent, // Ensures ripple effect blends with background
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          splashColor: Colors.blue.withOpacity(0.3),
          highlightColor: Colors.blue.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Tooltip(message: tooltip, child: Icon(icon, size: 24)),
          ),
        ),
      ),
    );
  }
}
