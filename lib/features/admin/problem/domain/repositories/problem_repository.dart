import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/problem/data/models/problem_model.dart';

abstract class AdminProblemRepository {
  Future<Either<AppFailure, ResponseWrapper<List<ProblemModel>>>> getProblems();
  Future<Either<AppFailure, ResponseWrapper<List<ProblemModel>>>> getIncidents();
}
