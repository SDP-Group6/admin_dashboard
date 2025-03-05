import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartModel {
  final List<BarChartGroupData> barGroups;
  final bool isPlaying;
  final double animationValue;

  BarChartModel(this.barGroups, this.isPlaying, this.animationValue);
}