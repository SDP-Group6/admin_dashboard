import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartModel {
  final List<FlSpot> spots;
  final bool isCurved;
  final Color color;
  final double strokeWidth;

  LineChartModel({required this.spots, required this.isCurved, required this.color, required this.strokeWidth});
}