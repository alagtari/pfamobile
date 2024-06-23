import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/exceptions.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/citizen/home/data/data_sources/notification_remote_data_source.dart';
import 'package:mobile/features/citizen/home/data/models/notification_model.dart';
import 'package:mobile/features/citizen/home/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationOnlineDataSource dataSource;

  NotificationRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<AppFailure, ResponseWrapper<List<NotificationModel>>>>
      getNotifications() async {
    try {
      final res = await dataSource.getNotifications();
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
