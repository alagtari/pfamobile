import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';

abstract class DriverPlanRepository {
  Future<Either<AppFailure, ResponseWrapper<List<PlanModel>>>> getPlans();
}
