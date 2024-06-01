import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/profile/data/models/change_password_model.dart';
import 'package:mobile/features/admin/profile/data/models/profile_model.dart';

abstract class ProfileOnlineDataSource {
  Future<ResponseWrapper<ChangePasswordModel>> updatePassword(
    ChangePasswordModel profile,
  );
  Future<Unit> updateProfile(
    ProfileModel profile,
  );
  Future<ResponseWrapper<ProfileModel>> viewProfile();
}

class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  @override
  Future<ResponseWrapper<ChangePasswordModel>> updatePassword(
      ChangePasswordModel profile) async {
    final res = await sl<Dio>().patch(
      "/auth/resetpassword",
      data: profile.toJson(),
    );
    return ResponseWrapper.fromJson(
      res.data,
      (p0) => ChangePasswordModel.fromJson(p0),
    );
  }

  @override
  Future<Unit> updateProfile(ProfileModel profile) async {
    await sl<Dio>().patch(
      "/auth/updateprofile",
      data: await profile.toFormData(),
    );
    return unit;
  }

  @override
  Future<ResponseWrapper<ProfileModel>> viewProfile() async {
    final res = await sl<Dio>().get(
      "/auth/me",
    );
    return ResponseWrapper.fromJson(
      res.data,
      (p0) => ProfileModel.fromJson(p0),
    );
  }
}
