import 'package:flutter/material.dart';
import '../widgets/robot_stats_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // List of robots with their stats
  final List<Map<String, String>> robots = [
    {
      "name": "Robot A",
      "usage": "22 Keyboards cleaned",
      "power": "65% Power remaining",
    },
    {
      "name": "Robot B",
      "usage": "15 Keyboards cleaned",
      "power": "80% Power remaining",
    },
    {
      "name": "Robot C",
      "usage": "30 Keyboards cleaned",
      "power": "50% Power remaining",
    },
  ];

  String selectedRobot = "Robot A"; // Default robot selection

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme properties

    // Extract border color from theme, fallback to black if not set
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    // Get the selected robot's stats
    final robotStats = robots.firstWhere(
      (robot) => robot["name"] == selectedRobot,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Message
          const Text(
            "Good Afternoon, Admin!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Robot Selection Card
          Card(
            elevation: 3, // Adds a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: borderColor, width: 2), // Themed border
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Robot:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: selectedRobot,
                    onChanged: (newValue) {
                      setState(() {
                        selectedRobot = newValue!;
                      });
                    },
                    items:
                        robots.map<DropdownMenuItem<String>>((robot) {
                          return DropdownMenuItem<String>(
                            value: robot["name"],
                            child: Text(
                              robot["name"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Display the selected robot's stats
          RobotStatsCard(
            robotName: robotStats["name"]!,
            usageStatus: robotStats["usage"]!,
            powerStatus: robotStats["power"]!,
          ),
        ],
      ),
    );
  }
}
