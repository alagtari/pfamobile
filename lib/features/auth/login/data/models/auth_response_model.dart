import 'package:mobile/core/enums/role_enum.dart';
import 'package:mobile/features/auth/login/domain/entities/auth_response_entity.dart';

class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel({
    required super.role,
    required super.token,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      role: getUserRoleFromString(json["role"]),
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'token': token,
    };
  }
}
