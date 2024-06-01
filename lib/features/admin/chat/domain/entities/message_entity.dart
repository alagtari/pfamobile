import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  String? id;
  final String? sender;
  final String content;
  final String roomId;
  final DateTime? createdAt;
  final bool? sent;

  MessageEntity({
    this.id,
    this.sender,
    required this.content,
    required this.roomId,
    this.sent,
    this.createdAt,
  });

  @override
  List<Object> get props => [];
}
