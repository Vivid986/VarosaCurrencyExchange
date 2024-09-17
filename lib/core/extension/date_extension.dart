extension DateExtension on DateTime {
  String get formattedDate =>
      "$year-${month.toString().padLeft(2, "0")}-${day.toString().padLeft(2, "0")}";
}
