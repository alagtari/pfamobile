part of 'bloc.dart';

@immutable
abstract class CalendarEvent {
  const CalendarEvent();
}

class GetCalendarsEvent extends CalendarEvent {
  final String date;
  const GetCalendarsEvent({required this.date});
}
