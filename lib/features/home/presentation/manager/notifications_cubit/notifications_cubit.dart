import 'package:bloc/bloc.dart';
import 'package:shop_flow/features/home/data/models/notification_model.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  List<NotificationModel> notifications = [];

  void addNotification(NotificationModel notification) {
    emit(NotificationsLoading());
    notifications.insert(0, notification);
    emitNotificationState();
  }

  void deleteNotification(NotificationModel notification) {
    emit(NotificationsLoading());
    notifications.remove(notification);
    emitNotificationState();
  }

  void emitNotificationState() {
    if (notifications.isEmpty) {
      emit(NotificationsInitial());
    } else {
      emit(
          NotificationsFilled(notifications: List.unmodifiable(notifications)));
    }
  }
}
