part of 'bloc.dart';

@immutable
abstract class NotificationEvent {
  const NotificationEvent();
}

class GetNotificationsEvent extends NotificationEvent {}
