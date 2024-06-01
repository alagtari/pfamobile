import 'package:mobile/features/admin/chat/domain/entities/message_entity.dart';

// ignore: must_be_immutable
class MessageModel extends MessageEntity {
  MessageModel({
    super.id,
    super.sender,
    required super.content,
    required super.roomId,
    super.sent,
    super.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      sender: json['sender'],
      content: json['content'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      roomId: json['room'],
      sent: json['sent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'room': roomId,
    };
  }
}
