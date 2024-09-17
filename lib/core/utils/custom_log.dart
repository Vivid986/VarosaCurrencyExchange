import 'package:flutter/foundation.dart';

class CustomLog {
  static void info(dynamic value, {String color = '37'}) {
    _printWithColor(value, color);
  }

  static void error(dynamic value) {
    _printWithColor(value, '31');
  }

  static void warning(dynamic value) {
    _printWithColor(value, "33");
  }

  static void success(dynamic value) {
    _printWithColor(value, "32");
  }

  static void action(dynamic value) {
    _printWithColor(value, "36");
  }

  static void _printWithColor(dynamic value, String color) {
    if (kDebugMode) {
      debugPrint("\x1B[${color}m $value \x1B[0m");
    }
  }
}
