import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/signup/data/data_sources/signup_remote_data_source.dart';
import 'package:mobile/features/signup/data/models/signup_model.dart';
import 'package:mobile/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupOnlineDataSource dataSource;

  SignupRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, Unit>> signup(SignupModel request) async {
    try {
      final res = await dataSource.signup(request);
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
