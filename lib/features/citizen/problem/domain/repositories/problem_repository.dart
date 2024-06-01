import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/citizen/problem/data/models/problem_model.dart';

abstract class ProblemRepository {
  Future<Either<AppFailure, ResponseWrapper<ProblemModel>>> addProblem(ProblemModel request);
}
