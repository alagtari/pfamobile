import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String? id;
  final String? sender;
  final String content;
  final String roomId;
  final DateTime? createdAt;
  final bool? sent;

  const MessageEntity({
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
