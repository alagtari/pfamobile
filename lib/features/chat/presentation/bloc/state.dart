part of 'bloc.dart';

@immutable
abstract class ChatState {
  const ChatState();
}

class ChatInitial extends ChatState {}

class GetRoomsLoading extends ChatState {}

class GetRoomsSuccess extends ChatState {
  final List<RoomModel> rooms;
  const GetRoomsSuccess({
    required this.rooms,
  });
}

class GetRoomsFailed extends ChatState {
  final String message;

  const GetRoomsFailed({
    required this.message,
  });
}

class GetRoomMessagesLoading extends ChatState {}

class GetRoomMessagesSuccess extends ChatState {
  final List<MessageModel> messages;
  const GetRoomMessagesSuccess({
    required this.messages,
  });
}

class GetRoomMessagesFailed extends ChatState {
  final String message;

  const GetRoomMessagesFailed({
    required this.message,
  });
}

class GetDriverRoomMessagesLoading extends ChatState {}

class GetDriverRoomMessagesSuccess extends ChatState {
  final List<MessageModel> messages;
  const GetDriverRoomMessagesSuccess({
    required this.messages,
  });
}

class GetDriverRoomMessagesFailed extends ChatState {
  final String message;

  const GetDriverRoomMessagesFailed({
    required this.message,
  });
}

class SendMessageLoading extends ChatState {}

class SendMessageSuccess extends ChatState {}

class SendMessageFailed extends ChatState {
  final String message;

  const SendMessageFailed({
    required this.message,
  });
}

class SendDriverMessageLoading extends ChatState {}

class SendDriverMessageSuccess extends ChatState {}

class SendDriverMessageFailed extends ChatState {
  final String message;

  const SendDriverMessageFailed({
    required this.message,
  });
}
