import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fuzzy_greenhouse/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class FirebaseInitService {
  static Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    print('Фоновое сообщение: ${message.messageId}');
  }

  static Future<void> saveCredentials({required String uid, required String token, String? email}) async {
    return FirebaseFirestore.instance.collection('users').doc(uid).set(<String, dynamic>{
      'fcmToken': token,
      'updatedAt': FieldValue.serverTimestamp(),
      if (email != null && email.isNotEmpty) 'email': email,
    }, SetOptions(merge: true));
  }

  static Future<void> initLocalNotifications() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(defaultPresentAlert: true);
    const initSettings = InitializationSettings(android: androidInit, iOS: iosInit);

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initSettings);
    await _setupFCM();
  }

  static Future<void> _setupFCM() async {
    final messaging = FirebaseMessaging.instance;
    final auth = FirebaseAuth.instance;
    final settings = await messaging.requestPermission(alert: true, badge: true, sound: true);
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    if (token == null) return;

    final user = auth.currentUser;
    if (user == null) return;

    await saveCredentials(uid: user.uid, token: token, email: user.email);

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;
      if (notification == null) return;

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            "high_importance_channel",
            "High Importance Notifications",
            importance: Importance.max,
            priority: Priority.high,
            showWhen: true,
            channelShowBadge: true,
          ),
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message);
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      final user = auth.currentUser;
      if (user == null) return;

      saveCredentials(uid: user.uid, email: user.email, token: newToken);
    });
  }
}
