import 'package:equatable/equatable.dart';

class ResetPasswordRequestEntity extends Equatable {
  final String email;
  final String code;
  final String password;

  const ResetPasswordRequestEntity({
    required this.email,
    required this.code,
    required this.password,
  });

  @override
  List<Object> get props => [email, code];
}
