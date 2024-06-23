import 'package:dio/dio.dart';
import 'package:mobile/core/common_used/response_wrapper.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/citizen/home/data/models/notification_model.dart';

abstract class NotificationOnlineDataSource {
  Future<ResponseWrapper<List<NotificationModel>>> getNotifications();
}

class NotificationOnlineDataSourceImpl implements NotificationOnlineDataSource {
  @override
  Future<ResponseWrapper<List<NotificationModel>>> getNotifications() async {
    final res = await sl<Dio>().get(
      "/citizen/notification",
    );
    try {
      return ResponseWrapper.fromJson(res.data, (p0) {
        List<NotificationModel> notificationList = [];
        for (var notification in p0 as List) {
          notificationList.add(NotificationModel.fromJson(notification));
        }
        return notificationList;
      });
    } catch (e) {
      rethrow;
    }
  }
}
