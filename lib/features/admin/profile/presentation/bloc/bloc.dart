import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/profile/data/models/profile_model.dart';
import 'package:mobile/features/admin/profile/domain/repositories/profile_repository.dart';
import 'package:mobile/features/admin/profile/data/models/change_password_model.dart';
part 'event.dart';
part 'state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _repo = sl<ProfileRepository>();

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<ChangePasswordEvent>(
      (event, emit) async {
        emit(ChangePasswordLoading());
        final res = await _repo.updatePassword((event.request));
        res.fold(
          (l) => emit(ChangePasswordFailed(message: l.message)),
          (r) => emit(ChangePasswordSuccess()),
        );
      },
    );

    on<UpdateProfileEvent>(
      (event, emit) async {
        emit(UpdateProfileLoading());
        final res = await _repo.updateProfile((event.request));
        res.fold(
          (l) => emit(UpdateProfileFailed(message: l.message)),
          (r) => emit(UpdateProfileSuccess()),
        );
      },
    );
    on<ViewProfileEvent>(
      (event, emit) async {
        emit(ViewProfileLoading());
        final res = await _repo.viewProfile();
        res.fold(
          (l) => emit(ViewProfileFailed(message: l.message)),
          (r) => emit(ViewProfileSuccess(profile: r.payload!)),
        );
      },
    );
  }
}
