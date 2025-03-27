import 'package:flutter/material.dart';
import '../widgets/robot_stats_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

  String selectedRobot = "Robot A";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    final robotStats = robots.firstWhere(
      (robot) => robot["name"] == selectedRobot,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Good Afternoon, Admin!",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: borderColor, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Robot:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    dropdownColor: const Color.fromARGB(255, 191, 191, 191),
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
                                color: Colors.black,
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
          RobotStatsCard(
            robotName: robotStats["name"]!,
            powerStatus: robotStats["power"]!,
          ),
        ],
      ),
    );
  }
}
