part of 'push_notification_bloc.dart';

sealed class PushNotificationBlocState with EquatableMixin {
  const PushNotificationBlocState();

  @override
  List<Object?> get props => [];
}

final class PushNotificationBlocStateNotInitialized extends PushNotificationBlocState {
  const PushNotificationBlocStateNotInitialized();
}

final class PushNotificationBlocStateLoading extends PushNotificationBlocState {
  const PushNotificationBlocStateLoading();
}

final class PushNotificationBlocStateError extends PushNotificationBlocState {
  const PushNotificationBlocStateError({required this.error});

  final dynamic error;

  @override
  List<Object?> get props => [error];
}

final class PushNotificationBlocStateData extends PushNotificationBlocState {
  const PushNotificationBlocStateData();
}
