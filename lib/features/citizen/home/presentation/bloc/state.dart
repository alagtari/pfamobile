part of 'bloc.dart';

@immutable
abstract class NotificationState {
  const NotificationState();
}

class NotificationInitial extends NotificationState {}

class GetNotificationsLoading extends NotificationState {}

class GetNotificationsSuccess extends NotificationState {
  final List<NotificationModel> notifications;
  const GetNotificationsSuccess({
    required this.notifications,
  });
}

class GetNotificationsFailed extends NotificationState {
  final String message;

  const GetNotificationsFailed({
    required this.message,
  });
}