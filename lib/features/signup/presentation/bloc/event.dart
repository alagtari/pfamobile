part of 'bloc.dart';

@immutable
abstract class SignupEvent {
  const SignupEvent();
}

class SignupUserEvent extends SignupEvent {
  final SignupModel request;
  const SignupUserEvent({
    required this.request,
  });
}
