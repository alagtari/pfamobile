
import 'package:mobile/features/auth/domain/entities/auth_request_entity.dart';

class AuthRequestModel extends AuthRequestEntity {
  const AuthRequestModel({required super.email, required super.password});

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthRequestModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
