part of 'push_notification_bloc.dart';

sealed class PushNotificationBlocEvent with EquatableMixin {
  const PushNotificationBlocEvent();

  @override
  List<Object?> get props => [];
}

final class PushNotificationBlocEventSend extends PushNotificationBlocEvent {
  const PushNotificationBlocEventSend({required this.token, required this.title, required this.body});

  final String token;
  final String title;
  final String body;

  @override
  List<Object?> get props => [title, body];
}
