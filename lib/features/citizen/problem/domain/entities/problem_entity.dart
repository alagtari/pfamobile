import 'package:equatable/equatable.dart';

class ProblemEntity extends Equatable {
  final String content;
  final String? image;

  const ProblemEntity({
    required this.content,
    this.image,
  });

  @override
  List<Object> get props => [];
}
