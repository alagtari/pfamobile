import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/driver/incident/data/models/incident_model.dart';

abstract class IncidentRepository {
  Future<Either<AppFailure, ResponseWrapper<IncidentModel>>> addIncident(IncidentModel request);
}
