import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/problem/data/data_sources/problem_remote_data_source.dart';
import 'package:mobile/features/admin/problem/data/models/problem_model.dart';
import 'package:mobile/features/admin/problem/domain/repositories/problem_repository.dart';

class AdminProblemRepositoryImpl implements AdminProblemRepository {
  final AdminProblemOnlineDataSource dataSource;

  AdminProblemRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<List<ProblemModel>>>>
      getProblems() async {
    try {
      final res = await dataSource.getProblems();
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
  Future<Either<AppFailure, ResponseWrapper<List<ProblemModel>>>>
      getIncidents() async {
    try {
      final res = await dataSource.getIncidents();
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
