import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/plan/data/data_sources/plan_remote_data_source.dart';
import 'package:mobile/features/plan/data/models/plan_model.dart';
import 'package:mobile/features/plan/domain/repositories/plan_repository.dart';

class PlanRepositoryImpl implements PlanRepository {
  final PlanOnlineDataSource dataSource;

  PlanRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<PlanModel>>> addPlan(PlanModel request) async {
    try {
      final res = await dataSource.addPlan(request);
      log(res.toString());
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
  Future<Either<AppFailure, Unit>> deletePlan(String id) async {
    try {
      final res = await dataSource.deletePlan(id);
      log(res.toString());
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
  Future<Either<AppFailure, ResponseWrapper<List<PlanModel>>>>
      getPlans() async {
    try {
      final res = await dataSource.getPlans();
      log(res.toString());
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
  Future<Either<AppFailure, ResponseWrapper<PlanModel>>> updatePlan(
      PlanModel request, String id) async {
    try {
      final res = await dataSource.updatePlan(request, id);
      log(res.toString());
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
