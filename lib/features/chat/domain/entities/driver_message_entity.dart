import 'package:equatable/equatable.dart';

class DriverMessageEntity extends Equatable {
  final String? id;
  final String? sender;
  final String content;
  final DateTime? createdAt;
  final bool? sent;

  const DriverMessageEntity({
    this.id,
    this.sender,
    required this.content,
    this.sent,
    this.createdAt,
  });

  @override
  List<Object> get props => [];
}
