import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/problem/data/models/problem_model.dart';

abstract class AdminProblemOnlineDataSource {
  Future<ResponseWrapper<List<ProblemModel>>> getProblems();
  Future<ResponseWrapper<List<ProblemModel>>> getIncidents();
}

class AdminProblemOnlineDataSourceImpl implements AdminProblemOnlineDataSource {
  @override
  Future<ResponseWrapper<List<ProblemModel>>> getProblems() async {
    final res = await sl<Dio>().get(
      "/admin/problem",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<ProblemModel> problemList = [];
        for (var problem in p0 as List) {
          problemList.add(ProblemModel.fromJson(problem));
        }
        return problemList;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<List<ProblemModel>>> getIncidents() async {
    final res = await sl<Dio>().get(
      "/admin/incident",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<ProblemModel> problemList = [];
        for (var problem in p0 as List) {
          problemList.add(ProblemModel.fromJson(problem));
        }
        return problemList;
      });
    } catch (e) {
      rethrow;
    }
  }
}
