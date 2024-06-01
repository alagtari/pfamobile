import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/city/data/models/add_location_model.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';

abstract class CityRepository {
  Future<Either<AppFailure, ResponseWrapper<List<CityModel>>>> getCities();
  Future<Either<AppFailure, ResponseWrapper<CityModel>>> addCity(CityModel request);
  Future<Either<AppFailure, LatLng?>> verifyCity({required String state,required String name});
  Future<Either<AppFailure, ResponseWrapper<CityModel>>> updateCity(CityModel request, String id);
  Future<Either<AppFailure, Unit>> deleteCity(String id);
  Future<Either<AppFailure, ResponseWrapper<LocationModel>>> addCityLocation(AddLocationModel location);
  Future<Either<AppFailure, Unit>> deleteCityLocation(String id);

}
