import 'package:mobile/features/auth/domain/entities/verify_code_request_entity.dart';

class VerifyCodeRequestModel extends VerifyCodeRequestEntity {
  const VerifyCodeRequestModel({
    required super.email,
    required super.code,
  });

  factory VerifyCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      VerifyCodeRequestModel(
        email: json['email'] as String,
        code: json['code'] as String,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
      };
}
