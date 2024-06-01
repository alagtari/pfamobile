import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/chat/data/models/driver_message_model.dart';
import 'package:mobile/features/chat/data/models/message_model.dart';
import 'package:mobile/features/chat/data/models/room_model.dart';

abstract class ChatRepository {
  Future<Either<AppFailure, ResponseWrapper<List<MessageModel>>>> getMessages(
      String id);
  Future<Either<AppFailure, ResponseWrapper<List<MessageModel>>>>
      getDriverMessages();
  Future<Either<AppFailure, ResponseWrapper<List<RoomModel>>>> getRooms();
  Future<Either<AppFailure, ResponseWrapper<MessageModel>>> sendMessage(
      MessageModel request);
  Future<Either<AppFailure, ResponseWrapper<MessageModel>>> sendDriverMessage(
      DriverMessageModel request);
}
