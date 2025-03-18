import 'package:flutter/material.dart';

class RobotStatsCard extends StatelessWidget {
  final String robotName;
  final String usageStatus;
  final String powerStatus;

  const RobotStatsCard({
    required this.robotName,
    required this.usageStatus,
    required this.powerStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme properties

    // Extract border color from theme, fallback to black if not set
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : Colors.black;

    return SizedBox(
      width: double.infinity, // Ensures the card takes full width
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Adds rounded corners
          side: BorderSide(color: borderColor, width: 2), // Apply theme border
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Robot Name (Title)
              Text(
                "Robot: $robotName",
                style: theme.textTheme.titleLarge?.copyWith(
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Power: $powerStatus",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            _getPowerColor(), // Changes color based on power level
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
                    child: _buildChartPlaceholder("Chart 1", borderColor),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildChartPlaceholder("Chart 2", borderColor),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              const Divider(height: 20, thickness: 1),

              // Row for Charts (Placeholder)
              Row(
                children: [
                  Expanded(
                    child: _buildChartPlaceholder("Chart 3", borderColor),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildChartPlaceholder("Chart 4", borderColor),
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
    int powerPercentage =
        int.tryParse(powerStatus.replaceAll(RegExp(r'[^0-9]'), '')) ?? 100;
    if (powerPercentage < 30) {
      return Colors.red; // Critical power
    } else if (powerPercentage < 60) {
      return Colors.orange; // Low power
    }
    return Colors.green; // Normal power
  }

  /// Builds a placeholder for charts (replace this with actual chart widgets)
  Widget _buildChartPlaceholder(String title, Color borderColor) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 2,
        ), // Apply same border color
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
