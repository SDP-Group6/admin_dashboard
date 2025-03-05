import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Logo", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          SidebarItem(title: "Dashboard", icon: Icons.dashboard),
          SidebarItem(title: "Scheduled Jobs", icon: Icons.calendar_today),
          SidebarItem(title: "Documents", icon: Icons.folder),
          SidebarItem(title: "Settings", icon: Icons.settings),
        ],
      ),
    );
  }
}

class SidebarItem extends StatefulWidget {
  final String title;
  final IconData icon;

  SidebarItem({required this.title, required this.icon});

  @override
  _SidebarItemState createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Stack(
        children: [
          // Background animation for left-to-right fill effect
          AnimatedContainer(
            duration: Duration(milliseconds: 200), // Fast animation
            width: _isHovered ? 250 : 0, // Expands from 0 to full width
            height: 40, // Consistent height
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // Sidebar content (icon + text)
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                Icon(widget.icon, size: 24),
                SizedBox(width: 10),
                Text(widget.title, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
