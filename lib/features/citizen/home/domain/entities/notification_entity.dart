import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final String title;
  final String content;
  final String type;
  final String city;
  final DateTime createdAt;

  const NotificationEntity({
    required this.title,
    required this.content,
    required this.type,
    required this.city,
    required this.createdAt,
  });

  @override
  List<Object> get props => [];
}
