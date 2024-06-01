import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/city/data/data_sources/city_remote_data_source.dart';
import 'package:mobile/features/admin/city/data/models/add_location_model.dart';
import 'package:mobile/features/admin/city/data/models/city_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:mobile/features/admin/city/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityOnlineDataSource dataSource;

  CityRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<CityModel>>> addCity(
      CityModel request) async {
    try {
      final res = await dataSource.addCity(request);
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<AppFailure, Unit>> deleteCity(String id) async {
    try {
      final res = await dataSource.deleteCity(id);

      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<AppFailure, ResponseWrapper<List<CityModel>>>>
      getCities() async {
    try {
      final res = await dataSource.getCities();
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<AppFailure, ResponseWrapper<CityModel>>> updateCity(
      CityModel request, String id) async {
    try {
      final res = await dataSource.updateCity(request, id);
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<AppFailure, LatLng?>> verifyCity(
      {required String state, required String name}) async {
    final res = await dataSource.verifyCity(state: state, name: name);
    if (res != null) {
      return right(res);
    } else {
      return Left(
        AppFailure(message: 'There is no city with this informations'),
      );
    }
  }

  @override
  Future<Either<AppFailure, ResponseWrapper<LocationModel>>> addCityLocation(
      AddLocationModel location) async {
    try {
      final res = await dataSource.addCityLocation(location);
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }


  @override
  Future<Either<AppFailure, Unit>> deleteCityLocation(String id) async {
    try {
      final res = await dataSource.deleteCityLocation(id);

      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }
}
