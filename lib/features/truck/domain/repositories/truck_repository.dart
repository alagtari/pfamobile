import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';
import 'package:mobile/features/truck/data/models/truck_model.dart';

abstract class TruckRepository {
  Future<Either<AppFailure, ResponseWrapper<List<TruckModel>>>> getTrucks();
Future<Either<AppFailure, ResponseWrapper<List<DriverModel>>>>  getAvailableDrivers();
  Future<Either<AppFailure, ResponseWrapper<TruckModel>>> addTruck(TruckModel request);
  Future<Either<AppFailure, ResponseWrapper<TruckModel>>> updateTruck(TruckModel request, String id);
  Future<Either<AppFailure, Unit>> deleteTruck(String id);
}
