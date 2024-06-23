import 'package:mobile/features/citizen/home/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.title,
    required super.content,
    required super.type,
    required super.city,
    required super.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      content: json['content'],
      type: json['type'],
      city: json['city'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'type': type,
      'city': city,
    };
  }
}
