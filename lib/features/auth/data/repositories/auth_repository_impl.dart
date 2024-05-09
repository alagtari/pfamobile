import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/auth/data/data_sources/remote_data_source.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/data/models/auth_request_model.dart';
import 'package:mobile/features/auth/data/models/reset_password_request_model.dart';
import 'package:mobile/features/auth/data/models/verify_code_request_model.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthOnlineDataSource dataSource;

  AuthRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<AuthResponseModel>>> login({
    required AuthRequestModel user,
  }) async {
    try {
      final res = await dataSource.login(user);
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

  @override
  Future<Either<AppFailure, Unit>> forgotPasswordCode(
      VerifyCodeRequestModel request) async {
    try {
      await dataSource.forgotPasswordCode(request);
      return right(unit);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(AppFailure(message: e.response?.data?["message"]));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> forgotPasswordEmail(String email) async {
    try {
      await dataSource.forgotPasswordEmail(email);
      return right(unit);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(AppFailure(message: e.response?.data?["message"]));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> resendCode(String email) async {
    try {
      await dataSource.resendCode(email);
      return right(unit);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(AppFailure(message: e.response?.data?["message"]));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> resetPassword(
      ResetPasswordRequestModel request) async {
    try {
      await dataSource.resetPassword(request);
      return right(unit);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(AppFailure(message: e.response?.data?["message"]));
    } catch (e) {
      return Left(AppFailure(message: 'Unexpected error occurred.'));
    }
  }
}
