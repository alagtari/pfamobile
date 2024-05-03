part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final AuthRequestModel request;
  const LoginEvent({required this.request});
}

class ForgotPasswordEmailEvent extends AuthEvent {
  final String email;
  const ForgotPasswordEmailEvent({required this.email});
}

class ForgotPasswordCodeEvent extends AuthEvent {
  final VerifyCodeRequestModel request;
  const ForgotPasswordCodeEvent({required this.request});
}

class ResendCodeEvent extends AuthEvent {
  final String email;
  const ResendCodeEvent({required this.email});
}

class ResetPasswordEvent extends AuthEvent {
  final ResetPasswordRequestModel request;
  const ResetPasswordEvent({required this.request});
}

class LogoutEvent extends AuthEvent {}
