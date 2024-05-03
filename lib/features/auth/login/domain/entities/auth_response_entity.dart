import 'package:mobile/core/enums/role_enum.dart';
import 'package:mobile/features/auth/login/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final String token;
  final UserRole role;

  const AuthResponseEntity({
    required this.token,
    required this.role,
  });

  @override
  List<Object> get props => [];
}
