import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/chat/data/models/room_model.dart';
import 'package:mobile/features/admin/chat/domain/repositories/chat_repository.dart';
import 'package:mobile/features/admin/chat/data/models/message_model.dart';
part 'event.dart';
part 'state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _repo = sl<ChatRepository>();

  ChatBloc() : super(ChatInitial()) {
    on<ChatEvent>((event, emit) {});
    on<GetRoomsEvent>(
      (event, emit) async {
        emit(GetRoomsLoading());
        final res = await _repo.getRooms();
        res.fold(
          (l) => emit(GetRoomsFailed(message: l.message)),
          (r) => emit(GetRoomsSuccess(rooms: r.payload!)),
        );
      },
    );
    on<GetRoomMessagesEvent>(
      (event, emit) async {
        emit(GetRoomMessagesLoading());
        final res = await _repo.getMessages(event.id);
        res.fold(
          (l) => emit(GetRoomMessagesFailed(message: l.message)),
          (r) => emit(GetRoomMessagesSuccess(messages: r.payload!)),
        );
      },
    );

    on<SendMessageEvent>(
      (event, emit) async {
        emit(SendMessageLoading());
        final res = await _repo.sendMessage(event.message);
        res.fold(
          (l) => emit(SendMessageFailed(message: l.message)),
          (r) => emit(SendMessageSuccess()),
        );
      },
    );
  }
}
