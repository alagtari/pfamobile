part of 'bloc.dart';

@immutable
abstract class ChatEvent {
  const ChatEvent();
}

class SendMessageEvent extends ChatEvent {
  final MessageModel message;
  const SendMessageEvent({
    required this.message,
  });
}

class UpdateChatEvent extends ChatEvent {
  final MessageModel chat;
  final String id;

  const UpdateChatEvent({
    required this.chat,
    required this.id,
  });
}

class GetRoomMessagesEvent extends ChatEvent {
  final String id;

  const GetRoomMessagesEvent({required this.id});
}

class GetRoomsEvent extends ChatEvent {}

class DeleteChatEvent extends ChatEvent {
  final String id;
  const DeleteChatEvent({
    required this.id,
  });
}
