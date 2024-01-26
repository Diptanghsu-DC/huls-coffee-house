import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:huls_coffee_house/notifications/local_notifications.dart';

Future<void> handleForegroundMessage(RemoteMessage message) async {
  debugPrint('Received message: ${message.notification?.title}');
  if (message.data['action'] == 'show_notification') {
    await showNotification(message.notification!.title ?? 'Title', message.notification!.body ?? 'Body');
  }
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFirebaseMessaging() async {

    await _firebaseMessaging.requestPermission();
    final String? fcmToken = await _firebaseMessaging.getToken();
    debugPrint('FCM Token: $fcmToken');


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleForegroundMessage(message);
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleForegroundMessage(message);
    });
  }
}
