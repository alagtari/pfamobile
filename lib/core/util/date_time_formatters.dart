import 'dart:developer';

import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  String formattedDate = DateFormat("d MMM y", "fr_FR").format(dateTime);
  return formattedDate;
}

String formatTime(DateTime dateTime) {
  String formattedTime = DateFormat.Hm().format(dateTime);
  return formattedTime;
}

String formatMessageTime(DateTime dateTime) {
  DateTime date = dateTime;
  return '${date.hour + 1}:${date.minute < 9 ? "0" : ""}${date.minute}';
}

String formatTimeString(String time) {
  List<String> parts = time.split(':');
  if (parts.length == 3) {
    return '${parts[0]}:${parts[1]}';
  } else {
    return time;
  }
}
