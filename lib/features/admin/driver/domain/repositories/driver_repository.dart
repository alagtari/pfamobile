import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/driver/data/models/driver_model.dart';

abstract class DriverRepository {
  Future<Either<AppFailure, ResponseWrapper<List<DriverModel>>>> getDrivers();
  Future<Either<AppFailure, ResponseWrapper<DriverModel>>> addDriver(DriverModel request);
  Future<Either<AppFailure, ResponseWrapper<DriverModel>>> updateDriver(DriverModel request, String id);
  Future<Either<AppFailure, Unit>> deleteDriver(String id);
}
