// notification_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push/model/push_notification';

// Events
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationReceived extends NotificationEvent {
  final PushNotification notification;

  const NotificationReceived(this.notification);

  @override
  List<Object> get props => [notification];
}

class NotificationCleared extends NotificationEvent {}

// States
abstract class NotificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<PushNotification> notifications;

  NotificationLoaded(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationCountUpdated extends NotificationState {
  final int count;

  NotificationCountUpdated(this.count);

  @override
  List<Object?> get props => [count];
}

class NotificationError extends NotificationState {
  final String message;

  NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}
// BLoC
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  List<PushNotification> _notifications = [];
  int _notificationCount = 0;

  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationReceived>((event, emit) {
      _notifications.add(event.notification);
      _notificationCount++;
      emit(NotificationLoaded(_notifications));
      emit(NotificationCountUpdated(_notificationCount));
    });

    on<NotificationCleared>((event, emit) {
      _notifications.clear();
      _notificationCount = 0;
      emit(NotificationLoaded(_notifications));
      emit(NotificationCountUpdated(_notificationCount));
    });
  }
}
