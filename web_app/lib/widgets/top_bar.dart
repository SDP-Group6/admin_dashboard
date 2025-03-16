import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title; // Dynamic title

  const TopBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dynamic Title
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // Action Buttons
          Row(
            children: [
              InkWell(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Notifications Clicked")),
                ),
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Tooltip(message: "Notifications", child: Icon(Icons.notifications, size: 24)),
                ),
              ),
              const SizedBox(width: 20),
              InkWell(
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile Clicked")),
                ),
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Tooltip(message: "Profile", child: Icon(Icons.person, size: 24)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
