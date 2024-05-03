import 'package:mobile/features/auth/login/domain/entities/reset_password_request_entity.dart';

class ResetPasswordRequestModel extends ResetPasswordRequestEntity {
  const ResetPasswordRequestModel({
    required super.email,
    required super.code,
    required super.password,
  });

  factory ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequestModel(
        email: json['email'] as String,
        code: json['code'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'code': code,
      };
}
