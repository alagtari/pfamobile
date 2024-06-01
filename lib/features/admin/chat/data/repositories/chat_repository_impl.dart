import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/admin/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:mobile/features/admin/chat/data/models/message_model.dart';
import 'package:mobile/features/admin/chat/data/models/room_model.dart';
import 'package:mobile/features/admin/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatOnlineDataSource dataSource;

  ChatRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<MessageModel>>> sendMessage(
      MessageModel request) async {
    try {
      final res = await dataSource.sendMessage(request);
      log(res.toString());
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }

  @override
  Future<Either<AppFailure, ResponseWrapper<List<MessageModel>>>> getMessages(
      String id) async {
    try {
      final res = await dataSource.getMessages(id);
      log(res.toString());
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }
    @override
  Future<Either<AppFailure, ResponseWrapper<List<RoomModel>>>> getRooms() async {
    try {
      final res = await dataSource.getRooms();
      log(res.toString());
      return right(res);
    } on AppException catch (e) {
      return Left(AppFailure(message: e.message));
    } on DioException catch (e) {
      return Left(
        AppFailure(message: e.response?.data?["message"]),
      );
    } catch (e) {
      return Left(
        AppFailure(message: 'Unexpected error occurred.'),
      );
    }
  }
}
