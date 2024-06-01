import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:latlong2/latlong.dart';
import 'package:mobile/core/common_used/app_prefs.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/chat/data/models/message_model.dart';
import 'package:mobile/features/admin/city/data/models/location_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  io.Socket? _socket;
  final String _serverUrl = 'http://localhost:5000';
  final StreamController<List<MessageModel>> _messagesController =
      StreamController<List<MessageModel>>.broadcast();
  final StreamController<LatLng> _driverLocationController =
      StreamController<LatLng>.broadcast();
  final StreamController<LocationModel> _visitedLocationController =
      StreamController<LocationModel>.broadcast();
  final List<MessageModel> _messages = [];

  Stream<List<MessageModel>> get messages => _messagesController.stream;
  Stream<LatLng> get driverLocation => _driverLocationController.stream;
  Stream<LocationModel> get visitedLocation =>
      _visitedLocationController.stream;

  void initSocket() {
    final token = sl<AppPrefs>().getToken();
    log(token ?? "");
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

    _socket!.on('receive-location', (data) {
      log(data.runtimeType.toString());
      final LatLng location = LatLng(data["latitude"], data["longitude"]);
      insertDriverLocation(location);
    });

    _socket!.on('receive-visited-location', (data) {
      log(data.runtimeType.toString());
      final LocationModel location = LocationModel.fromJson(data);
      insertVisitedLocation(location);
    });
  }

  void joinMissionRoom(String roomName) {
    _socket!.emit('join-mission-room', roomName);
    log('Joined mission room: $roomName');
  }

  void leaveMissionRoom(String roomName) {
    _socket!.emit('leave-mission-room', roomName);
    log('Left mission room: $roomName');
  }

  void sendLocation(Map<String, dynamic> location, String roomName) {
    _socket!.emit('send-location', {location, roomName});
    log('Sent location to room $roomName: $location');
  }

  void insertMessage(MessageModel message) {
    _messages.add(message);
    _messagesController.sink.add(_messages);
  }

  void insertDriverLocation(LatLng location) {
    _driverLocationController.sink.add(location);
  }

  void insertVisitedLocation(LocationModel location) {
    _visitedLocationController.sink.add(location);
  }

  void dispose() {
    _socket!.disconnect();
    _socket!.dispose();
    _messagesController.close();
  }
}
