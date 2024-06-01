import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/plan/data/models/plan_model.dart';
import 'package:mobile/features/driver/home/data/data_sources/plan_remote_data_source.dart';
import 'package:mobile/features/driver/home/domain/repositories/driver_plan_repository.dart';

class DriverPlanRepositoryImpl implements DriverPlanRepository {
  final DriverPlanOnlineDataSource dataSource;

  DriverPlanRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<List<PlanModel>>>>
      getPlans() async {
    try {
      final res = await dataSource.getPlans();
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
