import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/driver/incident/data/data_sources/incident_remote_data_source.dart';
import 'package:mobile/features/driver/incident/data/models/incident_model.dart';
import 'package:mobile/features/driver/incident/domain/repositories/incident_repository.dart';

class IncidentRepositoryImpl implements IncidentRepository {
  final IncidentOnlineDataSource dataSource;

  IncidentRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<IncidentModel>>> addIncident(
      IncidentModel request) async {
    try {
      final res = await dataSource.addIncident(request);
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
