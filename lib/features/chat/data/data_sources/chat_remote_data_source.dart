import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/common_used/socket_service.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/chat/data/models/driver_message_model.dart';
import 'package:mobile/features/chat/data/models/message_model.dart';
import 'package:mobile/features/chat/data/models/room_model.dart';

abstract class ChatOnlineDataSource {
  Future<ResponseWrapper<List<MessageModel>>> getMessages(String id);
  Future<ResponseWrapper<List<MessageModel>>> getDriverMessages();

  Future<ResponseWrapper<List<RoomModel>>> getRooms();
  Future<ResponseWrapper<MessageModel>> sendMessage(MessageModel message);
  Future<ResponseWrapper<MessageModel>> sendDriverMessage(
      DriverMessageModel message);
}

class ChatOnlineDataSourceImpl implements ChatOnlineDataSource {
  @override
  Future<ResponseWrapper<MessageModel>> sendMessage(
      MessageModel message) async {
    final res = await sl<Dio>().post(
      "/message",
      data: message.toJson(),
    );
    final socketService = sl<SocketService>();
    socketService.insertMessage(MessageModel.fromJson(res.data["payload"]));
    return ResponseWrapper.fromJson(
        res.data, (p0) => MessageModel.fromJson(p0));
  }

  @override
  Future<ResponseWrapper<MessageModel>> sendDriverMessage(
      DriverMessageModel message) async {
    final res = await sl<Dio>().post(
      "/message/driver",
      data: message.toJson(),
    );
    final socketService = sl<SocketService>();
    socketService.insertMessage(MessageModel.fromJson(res.data["payload"]));
    return ResponseWrapper.fromJson(
      res.data,
      (p0) => MessageModel.fromJson(p0),
    );
  }

  @override
  Future<ResponseWrapper<List<MessageModel>>> getMessages(String id) async {
    final res = await sl<Dio>().get(
      "/message/$id",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<MessageModel> messageList = [];
        for (var message in p0 as List) {
          messageList.add(MessageModel.fromJson(message));
        }
        return messageList;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<List<MessageModel>>> getDriverMessages() async {
    final res = await sl<Dio>().get(
      "/message/driver",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<MessageModel> messageList = [];
        for (var message in p0 as List) {
          messageList.add(MessageModel.fromJson(message));
        }
        return messageList;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseWrapper<List<RoomModel>>> getRooms() async {
    final res = await sl<Dio>().get(
      "/message",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<RoomModel> roomList = [];
        for (var room in p0 as List) {
          roomList.add(RoomModel.fromJson(room));
        }
        return roomList;
      });
    } catch (e) {
      rethrow;
    }
  }
}
