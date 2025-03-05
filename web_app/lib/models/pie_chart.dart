import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartModel {
  final List<PieChartSectionData> sections;
  final bool showCenterText;
  final String centerText;

  PieChartModel(this.sections, this.showCenterText, this.centerText);
}