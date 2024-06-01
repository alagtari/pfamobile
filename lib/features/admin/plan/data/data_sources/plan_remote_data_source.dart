import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';

abstract class PlanOnlineDataSource {
  Future<ResponseWrapper<List<PlanModel>>> getPlans();
  Future<ResponseWrapper<PlanModel>> addPlan(PlanModel plan);
  Future<ResponseWrapper<PlanModel>> updatePlan(PlanModel plan, String id);
  Future<Unit> deletePlan(String id);
}

class PlanOnlineDataSourceImpl implements PlanOnlineDataSource {
  @override
  Future<ResponseWrapper<PlanModel>> addPlan(PlanModel plan) async {
    final res = await sl<Dio>().post(
      "/admin/plan",
      data: plan.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => PlanModel.fromJson(p0));
  }

  @override
  Future<Unit> deletePlan(String id) async {
    await sl<Dio>().delete(
      "/admin/plan/$id",
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<List<PlanModel>>> getPlans() async {
    final res = await sl<Dio>().get(
      "/admin/plan",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<PlanModel> planList = [];
        for (var plan in p0 as List) {
          planList.add(PlanModel.fromJson(plan));
        }
        return planList ;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<PlanModel>>updatePlan(PlanModel plan, String id) async {
    final res = await sl<Dio>().patch(
      "/admin/plan/$id",
      data: plan.toJson(),
    );
    return ResponseWrapper.fromJson(res.data, (p0) => PlanModel.fromJson(p0));
  }
}
