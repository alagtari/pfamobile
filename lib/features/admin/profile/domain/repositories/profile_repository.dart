import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/profile/data/models/change_password_model.dart';
import 'package:mobile/features/admin/profile/data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<AppFailure, ResponseWrapper<ChangePasswordModel>>>
      updatePassword(ChangePasswordModel request);
  Future<Either<AppFailure, Unit>> updateProfile(ProfileModel request);
  Future<Either<AppFailure, ResponseWrapper<ProfileModel>>>
      viewProfile();
}
