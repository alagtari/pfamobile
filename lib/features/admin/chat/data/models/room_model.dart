import 'package:mobile/features/admin/chat/data/models/message_model.dart';
import 'package:mobile/features/admin/chat/data/models/user_preview_model.dart';
import 'package:mobile/features/admin/chat/domain/entities/room_entity.dart';

// ignore: must_be_immutable
class RoomModel extends RoomEntity {
  const RoomModel({
    required super.id,
    required super.user,
    required super.latestMessage,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['_id'],
      user: UserPreviewModel.fromJson(json['user']),
      latestMessage: json['latestMessage'] != null
          ? MessageModel.fromJson(json['latestMessage'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  RoomModel copyWith({
    MessageModel? message,
  }) {
    return RoomModel(
      id: id,
      latestMessage: message,
      user: user,
    );
  }
}
