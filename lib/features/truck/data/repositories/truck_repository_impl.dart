import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/driver/data/models/driver_model.dart';
import 'package:mobile/features/truck/data/data_sources/truck_remote_data_source.dart';
import 'package:mobile/features/truck/data/models/truck_model.dart';
import 'package:mobile/features/truck/domain/repositories/truck_repository.dart';

class TruckRepositoryImpl implements TruckRepository {
  final TruckOnlineDataSource dataSource;

  TruckRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<TruckModel>>> addTruck(
      TruckModel request) async {
    try {
      final res = await dataSource.addTruck(request);
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
  Future<Either<AppFailure, Unit>> deleteTruck(String id) async {
    try {
      final res = await dataSource.deleteTruck(id);
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
  Future<Either<AppFailure, ResponseWrapper<List<TruckModel>>>>
      getTrucks() async {
    try {
      final res = await dataSource.getTrucks();
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
  Future<Either<AppFailure, ResponseWrapper<TruckModel>>> updateTruck(
      TruckModel request, String id) async {
    try {
      final res = await dataSource.updateTruck(request, id);
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
  Future<Either<AppFailure, ResponseWrapper<List<DriverModel>>>>
      getAvailableDrivers() async {
    try {
      final res = await dataSource.getAvailableDrivers();
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
