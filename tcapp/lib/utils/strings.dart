String formatEventTime(DateTime? startTime, DateTime? endTime) {
  if (startTime == null || endTime == null) return '';
  final start = startTime.toLocal();
  final end = endTime.toLocal();
  final startYear = start.year;
  final startMonth = start.month;
  final startDay = start.day;
  final startHour = start.hour;
  final startMinute = start.minute;
  final endHour = end.hour;
  final endMinute = end.minute;
  final startHourStr = startHour.toString().padLeft(2, '0');
  final startMinuteStr = startMinute.toString().padLeft(2, '0');
  final endHourStr = endHour.toString().padLeft(2, '0');
  final endMinuteStr = endMinute.toString().padLeft(2, '0');
  return '$startYear年$startMonth月$startDay日 '
      '$startHourStr:$startMinuteStr ~ $endHourStr:$endMinuteStr';
}
