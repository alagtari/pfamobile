import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  Utils._();
}

extension StringExtension on String {
  String capitalize() {
    return isNotEmpty
        ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
        : this;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String format24h() {
    final hourStr = hour.toString().padLeft(2, '0');
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hourStr:$minuteStr';
  }
}

extension DateTimeExtension on DateTime {
  String formatDayMonthYear() {
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(this);
  }
}
