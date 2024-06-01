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
class SendDriverMessageEvent extends ChatEvent {
  final DriverMessageModel message;
  const SendDriverMessageEvent({
    required this.message,
  });
}

class GetRoomMessagesEvent extends ChatEvent {
  final String id;

  const GetRoomMessagesEvent({required this.id});
}

class GetDriverRoomMessagesEvent extends ChatEvent {}

class GetRoomsEvent extends ChatEvent {}
