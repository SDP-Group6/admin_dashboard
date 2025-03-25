class ChartData {
  final String label;
  final int keyboardsCleaned;

  ChartData(this.label, this.keyboardsCleaned);
}

class ActiveTimeStat {
  final Duration day;
  final Duration week;
  final Duration hour;

  ActiveTimeStat({required this.day, required this.week, required this.hour});
}

class RobotChartStats {
  static final Map<String, List<ChartData>> dayStats = {
    'Robot A': [
      ChartData('08:00', 2),
      ChartData('10:00', 3),
      ChartData('12:00', 4),
      ChartData('14:00', 5),
      ChartData('16:00', 4),
      ChartData('18:00', 3),
    ],
    'Robot B': [
      ChartData('08:00', 1),
      ChartData('10:00', 2),
      ChartData('12:00', 3),
      ChartData('14:00', 2),
      ChartData('16:00', 2),
      ChartData('18:00', 1),
    ],
    'Robot C': [
      ChartData('08:00', 3),
      ChartData('10:00', 4),
      ChartData('12:00', 5),
      ChartData('14:00', 6),
      ChartData('16:00', 5),
      ChartData('18:00', 4),
    ],
  };

  static final Map<String, List<ChartData>> weekStats = {
    'Robot A': [
      ChartData('Mon', 12),
      ChartData('Tue', 15),
      ChartData('Wed', 14),
      ChartData('Thu', 10),
      ChartData('Fri', 18),
      ChartData('Sat', 20),
      ChartData('Sun', 16),
    ],
    'Robot B': [
      ChartData('Mon', 8),
      ChartData('Tue', 11),
      ChartData('Wed', 9),
      ChartData('Thu', 13),
      ChartData('Fri', 12),
      ChartData('Sat', 10),
      ChartData('Sun', 14),
    ],
    'Robot C': [
      ChartData('Mon', 17),
      ChartData('Tue', 16),
      ChartData('Wed', 15),
      ChartData('Thu', 19),
      ChartData('Fri', 20),
      ChartData('Sat', 22),
      ChartData('Sun', 18),
    ],
  };

  static final Map<String, List<ChartData>> hourStats = {
    'Robot A': [
      ChartData('00:00', 2),
      ChartData('00:10', 3),
      ChartData('00:20', 4),
      ChartData('00:30', 5),
      ChartData('00:40', 4),
      ChartData('00:50', 3),
    ],
    'Robot B': [
      ChartData('00:00', 1),
      ChartData('00:10', 2),
      ChartData('00:20', 3),
      ChartData('00:30', 2),
      ChartData('00:40', 2),
      ChartData('00:50', 1),
    ],
    'Robot C': [
      ChartData('00:00', 3),
      ChartData('00:10', 4),
      ChartData('00:20', 5),
      ChartData('00:30', 6),
      ChartData('00:40', 5),
      ChartData('00:50', 4),
    ],
  };

  static final Map<String, ActiveTimeStat> activeTimeStats = {
    'Robot A': ActiveTimeStat(
      day: Duration(hours: 4, minutes: 25),
      week: Duration(days: 2, hours: 14),
      hour: Duration(minutes: 38),
    ),
    'Robot B': ActiveTimeStat(
      day: Duration(hours: 3, minutes: 40),
      week: Duration(days: 1, hours: 12),
      hour: Duration(minutes: 25),
    ),
    'Robot C': ActiveTimeStat(
      day: Duration(hours: 5, minutes: 5),
      week: Duration(days: 3, hours: 3),
      hour: Duration(minutes: 42),
    ),
  };
}
