import 'package:dartz/dartz.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/errors/failures.dart';
import 'package:mobile/features/citizen/home/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<AppFailure, ResponseWrapper<List<NotificationModel>>>> getNotifications();
}
