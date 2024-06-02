import 'package:equatable/equatable.dart';
import 'package:mobile/features/chat/data/models/user_preview_model.dart';

class ProblemEntity extends Equatable {
  final String content;
  final String? image;
  final UserPreviewModel user;
  final DateTime createdAt;

  const ProblemEntity({
    required this.content,
    this.image,
    required this.user,
    required this.createdAt,
  });

  @override
  List<Object> get props => [];
}
