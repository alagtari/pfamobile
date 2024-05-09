part of 'bloc.dart';

@immutable
abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class GetSignupsLoading extends SignupState {}



class SignupUserLoading extends SignupState {}

class SignupUserSuccess extends SignupState {}

class SignupUserFailed extends SignupState {
  final String message;

  const SignupUserFailed({
    required this.message,
  });
}
