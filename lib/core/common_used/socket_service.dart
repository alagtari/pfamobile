import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/admin/chat/data/models/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  io.Socket? _socket;
  final String _serverUrl = 'http://localhost:5000';
  final StreamController<List<MessageModel>> _messagesController =
      StreamController<List<MessageModel>>.broadcast();
  final List<MessageModel> _messages = [];

  Stream<List<MessageModel>> get messages => _messagesController.stream;

  void initSocket() {
    final token = sl<AppPrefs>().getToken();
    log(token!);
    _socket = io.io(_serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'extraHeaders': {
        'token': token,
      }
    });

    _socket!.connect();

    _socket!.onConnect((_) {
      log('Connected to the server');
    });

    _socket!.onDisconnect((_) {
      log('Disconnected from the server');
    });

    _socket!.on('chat message', (data) {
      log(data.runtimeType.toString());

      final message = MessageModel.fromJson(data);
      insertMessage(message);
    });
  }

  void sendMessage(String receiverId, String message, String chatRoom) {
    _socket!.emit('chat message', {
      'receiverId': receiverId,
      'text': message,
      'chatRoom': chatRoom,
    });
  }

  void insertMessage(MessageModel message) {
    _messages.add(message);
    _messagesController.sink.add(_messages);
  }

  void dispose() {
    _socket!.disconnect();
    _socket!.dispose();
    _messagesController.close();
  }
}
