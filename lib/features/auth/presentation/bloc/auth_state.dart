part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthResponseModel response;

  const LoginSuccess({
    required this.response,
  });
}

class LoginFailed extends AuthState {
  final String message;

  const LoginFailed({
    required this.message,
  });
}

class ForgotPasswordEmailLoading extends AuthState {}

class ForgotPasswordEmailSuccess extends AuthState {}

class ForgotPasswordEmailFailed extends AuthState {
  final String message;
  const ForgotPasswordEmailFailed({
    required this.message,
  });
}

class ForgotPasswordCodeLoading extends AuthState {}

class ForgotPasswordCodeSuccess extends AuthState {}

class ForgotPasswordCodeFailed extends AuthState {
  final String message;
  const ForgotPasswordCodeFailed({
    required this.message,
  });
}

class ResendCodeLoading extends AuthState {}

class ResendCodeSuccess extends AuthState {}

class ResendCodeFailed extends AuthState {
  final String message;
  const ResendCodeFailed({
    required this.message,
  });
}

class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordFailed extends AuthState {
  final String message;
  const ResetPasswordFailed({
    required this.message,
  });
}
