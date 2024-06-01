import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/driver/misson/data/models/misson_model.dart';

abstract class MissionRepository {
  Future<Either<AppFailure,List<LatLng>>> getDirections(LatLng start, LatLng end);
  Future<Either<AppFailure, Unit>> startMission(String id);
  Future<Either<AppFailure, Unit>> endMission(String id);
  Future<Either<AppFailure, Unit>> visitLocation(String locationId, String planId);

}
