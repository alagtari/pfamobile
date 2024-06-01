import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/citizen/calendar/data/models/citizen_plan_model.dart';

abstract class CalendarRepository {
  Future<Either<AppFailure, ResponseWrapper<List<CitizenPlanModel>>>> getCalendars(String date);
}
