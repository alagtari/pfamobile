import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/city/data/models/city_model.dart';

abstract class CityRepository {
  Future<Either<AppFailure, ResponseWrapper<List<CityModel>>>> getCities();
  Future<Either<AppFailure, ResponseWrapper<CityModel>>> addCity(CityModel request);
  Future<Either<AppFailure, ResponseWrapper<CityModel>>> updateCity(CityModel request, String id);
  Future<Either<AppFailure, Unit>> deleteCity(String id);
}
