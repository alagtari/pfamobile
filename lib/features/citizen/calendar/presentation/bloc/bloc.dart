import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/citizen/calendar/data/models/citizen_plan_model.dart';
import 'package:mobile/features/citizen/calendar/domain/repositories/calendar_repository.dart';
part 'event.dart';
part 'state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final _repo = sl<CalendarRepository>();

  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarEvent>((event, emit) {});
    on<GetCalendarsEvent>(
      (event, emit) async {
        emit(GetCalendarsLoading());
        final res = await _repo.getCalendars(event.date);
        res.fold(
          (l) => emit(GetCalendarsFailed(message: l.message)),
          (r) => emit(GetCalendarsSuccess(plans: r.payload!)),
        );
      },
    );
  }
}
