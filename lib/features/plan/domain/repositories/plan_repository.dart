import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/plan/data/models/plan_model.dart';

abstract class PlanRepository {
  Future<Either<AppFailure, ResponseWrapper<List<PlanModel>>>> getPlans();
  Future<Either<AppFailure, ResponseWrapper<PlanModel>>> addPlan(PlanModel request);
  Future<Either<AppFailure, ResponseWrapper<PlanModel>>> updatePlan(PlanModel request, String id);
  Future<Either<AppFailure, Unit>> deletePlan(String id);
}
