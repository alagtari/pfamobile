part of 'bloc.dart';

@immutable
abstract class ProfileEvent {
  const ProfileEvent();
}

class ViewProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final ProfileModel request;
  const UpdateProfileEvent({
    required this.request,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final ChangePasswordModel request;

  const ChangePasswordEvent({
    required this.request,
  });
}
