import 'package:equatable/equatable.dart';
import 'package:mobile/features/admin/chat/data/models/message_model.dart';
import 'package:mobile/features/admin/chat/data/models/user_preview_model.dart';

class RoomEntity extends Equatable {
  final String id;
  final UserPreviewModel user;
  final MessageModel? latestMessage;

  const RoomEntity({
    required this.id,
    required this.user,
    required this.latestMessage,
  });

  @override
  List<Object> get props => [];
}
