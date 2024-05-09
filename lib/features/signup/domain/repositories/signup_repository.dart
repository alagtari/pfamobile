import 'package:dartz/dartz.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/signup/data/models/signup_model.dart';

abstract class SignupRepository {
  Future<Either<AppFailure, Unit>> signup(SignupModel request);
}
