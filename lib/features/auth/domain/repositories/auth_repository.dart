import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/data/models/auth_request_model.dart';
import 'package:mobile/features/auth/data/models/reset_password_request_model.dart';
import 'package:mobile/features/auth/data/models/verify_code_request_model.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, ResponseWrapper<AuthResponseModel>>> login(
      {required AuthRequestModel user});
  Future <Either<AppFailure,Unit>> forgotPasswordEmail(String email);
  Future <Either<AppFailure,Unit>> forgotPasswordCode(VerifyCodeRequestModel request);
  Future <Either<AppFailure,Unit>> resetPassword(ResetPasswordRequestModel request);
  Future <Either<AppFailure,Unit>> resendCode(String email);
}
