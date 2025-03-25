import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/chart_data.dart';

class RobotStatsCard extends StatefulWidget {
  final String robotName;
  final String powerStatus;

  const RobotStatsCard({
    required this.robotName,
    required this.powerStatus,
    super.key,
  });

  @override
  State<RobotStatsCard> createState() => _RobotStatsCardState();
}

class _RobotStatsCardState extends State<RobotStatsCard> {
  int selectedIndex = 0;
  final List<String> toggleLabels = ["Day", "Week", "Hour"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color borderColor =
        theme.cardTheme.shape is RoundedRectangleBorder
            ? (theme.cardTheme.shape as RoundedRectangleBorder).side.color
            : theme.dividerColor;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor, width: 2),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 239, 255, 236),
                Color.fromARGB(255, 255, 248, 235),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Robot: ${widget.robotName}",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Power: ${widget.powerStatus}",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _getPowerColor(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 20, thickness: 1),
              Row(
                children: [
                  Expanded(child: _buildActiveTimeStat()),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildChartPlaceholder("Chart 2", Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 20, thickness: 1),
              Center(
                child: ToggleButtons(
                  isSelected: List.generate(3, (i) => i == selectedIndex),
                  onPressed: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.black,
                  borderColor: Colors.black,
                  selectedBorderColor: Colors.black,
                  constraints: const BoxConstraints(
                    minWidth: 80,
                    minHeight: 36,
                  ),
                  children:
                      toggleLabels
                          .map(
                            (label) => Text(
                              label,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Keyboards Cleaned (${toggleLabels[selectedIndex]})",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(height: 200, child: _buildLineChart(Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActiveTimeStat() {
    final robotKey = widget.robotName.trim();
    final timeStat = RobotChartStats.activeTimeStats[robotKey];

    if (timeStat == null) {
      return _buildStyledTimeBox("No time data");
    }

    Duration duration;
    switch (selectedIndex) {
      case 1:
        duration = timeStat.week;
        break;
      case 2:
        duration = timeStat.hour;
        break;
      default:
        duration = timeStat.day;
    }

    String formatted = _formatDuration(duration);
    return _buildStyledTimeBox("Active Time\n$formatted");
  }

  Widget _buildStyledTimeBox(String text) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 222, 235, 255),
            Color.fromARGB(255, 206, 222, 255),
          ],
        ),
        border: Border.all(color: Colors.black, width: 2),
      ),
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  String _formatDuration(Duration d) {
    if (d.inHours >= 24) {
      final days = d.inDays;
      final hours = d.inHours % 24;
      return "${days}d ${hours}h";
    } else if (d.inHours > 0) {
      return "${d.inHours}h ${d.inMinutes.remainder(60)}m";
    } else {
      return "${d.inMinutes}m";
    }
  }

  Widget _buildLineChart(Color borderColor) {
    Map<String, List<ChartData>> dataMap;
    switch (selectedIndex) {
      case 1:
        dataMap = RobotChartStats.weekStats;
        break;
      case 2:
        dataMap = RobotChartStats.hourStats;
        break;
      default:
        dataMap = RobotChartStats.dayStats;
    }

    final robotKey = widget.robotName.trim();
    final robotData = dataMap[robotKey] ?? [];

    if (robotData.isEmpty) {
      return const Center(
        child: Text(
          "No data available",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }

    final maxY =
        robotData
            .map((e) => e.keyboardsCleaned)
            .reduce((a, b) => a > b ? a : b)
            .toDouble();
    final yInterval = (maxY / 5).ceilToDouble();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
      child: LineChart(
        LineChartData(
          clipData: FlClipData.none(),
          minY: 0,
          maxY: maxY + (maxY * 0.2),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    '${robotData[spot.x.toInt()].label}\n',
                    const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '${spot.y.toInt()} cleaned',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  );
                }).toList();
              },
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Keyboards',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              axisNameSize: 30,
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: yInterval,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index >= 0 && index < robotData.length) {
                    return SideTitleWidget(
                      meta: meta,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          robotData[index].label,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                robotData.length,
                (index) => FlSpot(
                  index.toDouble(),
                  robotData[index].keyboardsCleaned.toDouble(),
                ),
              ),
              isCurved: true,
              color: Colors.blueAccent,
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.orange,
                    strokeWidth: 2,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Color _getPowerColor() {
    final powerPercentage =
        int.tryParse(widget.powerStatus.replaceAll(RegExp(r'[^0-9]'), '')) ??
        100;
    if (powerPercentage < 30) return Colors.red;
    if (powerPercentage < 60) return Colors.orange;
    return Colors.green;
  }

  Widget _buildPlaceholderBox(String content) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          content,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildChartPlaceholder(String title, Color borderColor) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 2),
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
