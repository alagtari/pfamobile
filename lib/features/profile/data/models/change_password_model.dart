import 'package:mobile/features/profile/domain/entities/change_password_entity.dart';

class ChangePasswordModel extends ChangePasswordEntity {
  const ChangePasswordModel({
    required super.oldPassword,
    required super.newPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      oldPassword: json['oldPassword'],
      newPassword: json['newPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }
}
