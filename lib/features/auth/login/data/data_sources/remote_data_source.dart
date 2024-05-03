import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/auth/login/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/login/data/models/auth_request_model.dart';
import 'package:mobile/features/auth/login/data/models/reset_password_request_model.dart';
import 'package:mobile/features/auth/login/data/models/verify_code_request_model.dart';

abstract class AuthOnlineDataSource {
  Future<ResponseWrapper<AuthResponseModel>> login(
    AuthRequestModel request,
  );

  Future<Unit> forgotPasswordEmail(String email);
  Future<Unit> forgotPasswordCode(VerifyCodeRequestModel request);
  Future<Unit> resetPassword(ResetPasswordRequestModel request);
  Future<Unit> resendCode(String email);
}

class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  @override
  Future<ResponseWrapper<AuthResponseModel>> login(
    AuthRequestModel request,
  ) async {
    final res = await sl<Dio>().post(
      "/auth/login",
      data: request.toJson(),
    );

    try {
      return ResponseWrapper.fromJson(
        res.data,
        (p0) => AuthResponseModel.fromJson(p0),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Unit> forgotPasswordEmail(String email) async {
    await sl<Dio>().patch(
      "/auth/forgotpassword",
      data: {"email": email},
    );
    return unit;
  }

  @override
  Future<Unit> forgotPasswordCode(VerifyCodeRequestModel request) async {
    await sl<Dio>().patch(
      "/auth/verifycode",
      data: request.toJson(),
    );
    try {
      return unit;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Unit> resendCode(String email) async {
    await sl<Dio>().patch(
      "/auth/resendcode",
      data: {"email": email},
    );
    try {
      return unit;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Unit> resetPassword(ResetPasswordRequestModel request) async {
    await sl<Dio>().patch(
      "/auth/newpassword",
      data: request.toJson(),
    );
    try {
      return unit;
    } catch (_) {
      rethrow;
    }
  }
}
