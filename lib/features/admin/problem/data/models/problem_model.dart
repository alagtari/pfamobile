import 'package:mobile/features/chat/data/models/user_preview_model.dart';
import 'package:mobile/features/admin/problem/domain/entities/problem_entity.dart';

class ProblemModel extends ProblemEntity {
  const ProblemModel({
    required super.content,
    super.image,
    required super.user,
    required super.createdAt,
  });

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      content: json['content'],
      image: json['image'],
      user: UserPreviewModel.fromJson(json['user']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'image': image,
      'user': user,
      'createdAt': createdAt,
    };
  }
}
