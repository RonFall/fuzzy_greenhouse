import 'dart:convert' show jsonEncode, jsonDecode;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

import '../../../firebase_api_data.dart';

part 'push_notification_bloc_event.dart';

part 'push_notification_bloc_state.dart';

class PushNotificationBloc extends Bloc<PushNotificationBlocEvent, PushNotificationBlocState> {
  PushNotificationBloc() : super(PushNotificationBlocStateNotInitialized()) {
    on<PushNotificationBlocEventSend>(_send);
  }

  Future<void> _send(PushNotificationBlocEventSend event, Emitter<PushNotificationBlocState> emit) async {
    if (state is PushNotificationBlocStateLoading) return;

    try {
      emit(PushNotificationBlocStateLoading());

      final url = Uri.parse('https://fcm.googleapis.com/v1/projects/fuzzygreenhouse/messages:send');
      final serverToken = await _getAccessToken();
      final headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer $serverToken'};
      final bodyData = {
        'message': {
          'token': event.token,
          'notification': {'title': event.title, 'body': event.body},
        },
      };

      final response = await http.post(url, headers: headers, body: jsonEncode(bodyData));
      final data = jsonDecode(response.body);

      if (data['error'] != null) {
        emit(PushNotificationBlocStateError(error: data.toString()));
        return;
      }

      emit(PushNotificationBlocStateData());
    } catch (e, s) {
      emit(PushNotificationBlocStateError(error: e));

      if (e is Exception) {
        addError(e, s);

        return;
      }

      rethrow;
    }
  }

  Future<String> _getAccessToken() async {
    final scopes = <String>['https://www.googleapis.com/auth/firebase.messaging'];
    final client = await auth.clientViaServiceAccount(auth.ServiceAccountCredentials.fromJson(serviceAccount), scopes);
    final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccount),
      scopes,
      client,
    );
    client.close();

    return credentials.accessToken.data;
  }
}
