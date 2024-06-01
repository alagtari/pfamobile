import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/citizen/problem/data/models/problem_model.dart';

abstract class ProblemOnlineDataSource {
  Future<ResponseWrapper<ProblemModel>> addProblem(ProblemModel incident);
}

class ProblemOnlineDataSourceImpl implements ProblemOnlineDataSource {
  @override
  Future<ResponseWrapper<ProblemModel>> addProblem(
      ProblemModel incident) async {
    final res = await sl<Dio>().post(
      "/citizen/problem",
      data: await incident.toFormData(),
    );
    return ResponseWrapper.fromJson(
        res.data, (p0) => ProblemModel.fromJson(p0));
  }
}
