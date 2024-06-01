import 'package:equatable/equatable.dart';

class IncidentEntity extends Equatable {
  final String content;
  final String? image;

  const IncidentEntity({
    required this.content,
    this.image,
  });

  @override
  List<Object> get props => [];
}
