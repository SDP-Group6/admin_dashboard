import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';
import '../widgets/info_card.dart';
import '../widgets/room_section.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(), // Left-side navigation
          Expanded(
            flex: 4,
            child: Column(
              children: [
                TopBar(), // Top header
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Afternoon, Admin!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: InfoCard(title: "Usage Status", value: "22 Keyboards cleaned")),
                            SizedBox(width: 16),
                            Expanded(child: InfoCard(title: "Power Status", value: "65% Power remaining")),
                          ],
                        ),
                        SizedBox(height: 20),
                        MeetingRoomSection(), // Meeting room bookings
                      ],
                    ),
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
