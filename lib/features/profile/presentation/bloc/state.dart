part of 'bloc.dart';

@immutable
abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class GetProfilesLoading extends ProfileState {}

class GetProfilesSuccess extends ProfileState {
  final List<ChangePasswordModel> profiles;
  const GetProfilesSuccess({
    required this.profiles,
  });
}

class GetProfilesFailed extends ProfileState {
  final String message;

  const GetProfilesFailed({
    required this.message,
  });
}

class ChangePasswordLoading extends ProfileState {}

class ChangePasswordSuccess extends ProfileState {}

class ChangePasswordFailed extends ProfileState {
  final String message;

  const ChangePasswordFailed({
    required this.message,
  });
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {}

class UpdateProfileFailed extends ProfileState {
  final String message;

  const UpdateProfileFailed({
    required this.message,
  });
}

class ViewProfileLoading extends ProfileState {}

class ViewProfileSuccess extends ProfileState {
  final ProfileModel profile;

  const ViewProfileSuccess({
    required this.profile,
  });
}

class ViewProfileFailed extends ProfileState {
  final String message;

  const ViewProfileFailed({
    required this.message,
  });
}
