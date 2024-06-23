import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/features/citizen/home/domain/repositories/notification_repository.dart';
import 'package:mobile/features/citizen/home/data/models/notification_model.dart';
part 'event.dart';
part 'state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final _repo = sl<NotificationRepository>();

  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});
    on<GetNotificationsEvent>(
      (event, emit) async {
        emit(GetNotificationsLoading());
        final res = await _repo.getNotifications();
        res.fold(
          (l) => emit(GetNotificationsFailed(message: l.message)),
          (r) => emit(GetNotificationsSuccess(notifications: r.payload!)),
        );
      },
    );
  }
}
