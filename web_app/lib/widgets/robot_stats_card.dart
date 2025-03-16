import 'package:flutter/material.dart';

class RobotStatsCard extends StatelessWidget {
  final String robotName;
  final String usageStatus;
  final String powerStatus;

  const RobotStatsCard({
    required this.robotName,
    required this.usageStatus,
    required this.powerStatus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ensures the card takes full width
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Adds rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Robot Name (Title)
              Text(
                "Robot: $robotName",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),

              // Row for Usage and Power Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Usage: $usageStatus",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Power: $powerStatus",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _getPowerColor(), // Changes color based on power level
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              const Divider(height: 20, thickness: 1),

              // Row for Charts (Placeholder)
              Row(
                children: [
                  Expanded(
                    child: _buildChartPlaceholder("Chart 1"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildChartPlaceholder("Chart 2"),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              const Divider(height: 20, thickness: 1),

              // Row for Charts (Placeholder)
              Row(
                children: [
                  Expanded(
                    child: _buildChartPlaceholder("Chart 3"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildChartPlaceholder("Chart 4"),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  /// Returns a color based on the power status (e.g., low power = red)
  Color _getPowerColor() {
    int powerPercentage = int.tryParse(powerStatus.replaceAll(RegExp(r'[^0-9]'), '')) ?? 100;
    if (powerPercentage < 30) {
      return Colors.red; // Critical power
    } else if (powerPercentage < 60) {
      return Colors.orange; // Low power
    }
    return Colors.green; // Normal power
  }

  /// Builds a placeholder for charts (replace this with actual chart widgets)
  Widget _buildChartPlaceholder(String title) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
