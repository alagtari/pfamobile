// ignore: must_be_immutable
import 'package:mobile/features/chat/domain/entities/driver_message_entity.dart';

class DriverMessageModel extends DriverMessageEntity {
  const DriverMessageModel({
    super.id,
    super.sender,
    required super.content,
    super.sent,
    super.createdAt,
  });

  factory DriverMessageModel.fromJson(Map<String, dynamic> json) {
    return DriverMessageModel(
      id: json['_id'],
      sender: json['sender'],
      content: json['content'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      sent: json['sent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }
}
