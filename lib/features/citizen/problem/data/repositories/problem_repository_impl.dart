import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/citizen/problem/data/data_sources/problem_remote_data_source.dart';
import 'package:mobile/features/citizen/problem/data/models/problem_model.dart';
import 'package:mobile/features/citizen/problem/domain/repositories/problem_repository.dart';

class ProblemRepositoryImpl implements ProblemRepository {
  final ProblemOnlineDataSource dataSource;

  ProblemRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<ProblemModel>>> addProblem(
      ProblemModel request) async {
    try {
      final res = await dataSource.addProblem(request);
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
