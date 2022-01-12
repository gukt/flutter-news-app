import 'package:intl/intl.dart';

extension TimeExtensions on DateTime {
  String get agoStyle {
    DateTime now = DateTime.now();
    Duration d = now.difference(this);
    int days = d.inDays;
    int hours = d.inHours;
    int minutes = d.inMinutes;
    if (days > 3) {
      var pattern = year == now.year ? 'MM-dd' : 'yyyy-MM-dd';
      return DateFormat(pattern).format(this);
    } else if (days > 0) {
      return '${days}d ago';
    } else if (hours > 0) {
      return '${hours}h ago';
    } else if (minutes > 0) {
      return '${minutes}m ago';
    } else {
      return 'just now';
    }
  }
}
