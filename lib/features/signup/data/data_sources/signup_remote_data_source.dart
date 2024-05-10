import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/signup/data/models/signup_model.dart';

abstract class SignupOnlineDataSource {
  Future<Unit> signup(SignupModel signup);
}

class SignupOnlineDataSourceImpl implements SignupOnlineDataSource {
  @override
  Future<Unit> signup(SignupModel signup) async {
    await sl<Dio>().post(
      "/auth/signup/citizen",
      data: await signup.toFormData(),
    );
    return unit;
  }
}
