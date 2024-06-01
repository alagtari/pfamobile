part of 'bloc.dart';

@immutable
abstract class CalendarState {
  const CalendarState();
}

class CalendarInitial extends CalendarState {}

class GetCalendarsLoading extends CalendarState {}

class GetCalendarsSuccess extends CalendarState {
  final List<CitizenPlanModel> plans;
  const GetCalendarsSuccess({
    required this.plans,
  });
}

class GetCalendarsFailed extends CalendarState {
  final String message;

  const GetCalendarsFailed({
    required this.message,
  });
}
