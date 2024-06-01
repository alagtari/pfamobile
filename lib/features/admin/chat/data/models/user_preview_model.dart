import 'package:mobile/features/admin/chat/domain/entities/user_preview_entity.dart';

// ignore: must_be_immutable
class UserPreviewModel extends UserPreviewEntity {
  const UserPreviewModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    super.image,
  });

  factory UserPreviewModel.fromJson(Map<String, dynamic> json) {
    return UserPreviewModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
