import 'package:equatable/equatable.dart';

class VerifyCodeRequestEntity extends Equatable {
  final String email;
  final String code;

  const VerifyCodeRequestEntity({
    required this.email,
    required this.code,
  });

  @override
  List<Object> get props => [email, code];
}
