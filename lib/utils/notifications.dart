import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:app_settings/app_settings.dart';
import 'package:http/http.dart' as http;

class NotificationManager {
  String? token = "";
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   await Firebase.initializeApp();

  //   if (kDebugMode) {
  //     print("Handling a background message: ${message.messageId}");
  //     print('Message data: ${message.data}');
  //     print('Message notification: ${message.notification?.title}');
  //     print('Message notification: ${message.notification?.body}');
  //   }
  // }

  void init() async {
    // used to pass messages from event handler to the UI
    // final _messageStreamController = BehaviorSubject<RemoteMessage>();

    final fcm = FirebaseMessaging.instance;

    requestPermission(fcm);
    // foregroundMessage();
    // isTokenRefresh();
    getToken(fcm);
  }

  void requestPermission(FirebaseMessaging fcm) async {
    final settings = await fcm.requestPermission();
    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }
  }

  void getToken(FirebaseMessaging fcm) async {
    final token = await fcm.getToken();
    if (kDebugMode) {
      print('Registration Token');
      print(token);
    }
  }

  // void isTokenRefresh() {
  //   messaging.onTokenRefresh.listen((event) {
  //     event.toString();
  //   });
  // }

  void foregroundMessage() {
    print("entered foreground");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Handling a foreground message: ${message.messageId}');
        print('Message data: ${message.data}');
        print('Message notification: ${message.notification!.title}');
        print('Message notification: ${message.notification!.body}');
      }
      // showNotifications(message);
    });
  }

  void initLocalNotifications(BuildContext context, RemoteMessage message) {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High Importance Channel',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(
      Duration.zero,
      () {
        _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
        );
      },
    );
  }
}

// NotificationManager notificationManager = NotificationManager();
// TODO: Set up foreground message handler
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   if (kDebugMode) {
    //     print('Handling a foreground message: ${message.messageId}');
    //     print('Message data: ${message.data}');
    //     print('Message notification: ${message.notification?.title}');
    //     print('Message notification: ${message.notification?.body}');
    //   }

    //   _messageStreamController.sink.add(message);
    // });

    // // TODO: Set up background message handler
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    //   void sendNotification({
    //     required String token,
    //     required String title,
    //     required String content,
    //   }) async {
    //     try {
    //       await http.post(
    //         Uri.parse('https://fcm.googleapis.com/fcm/send'),
    //         headers: <String, String> {
    //           'Content-Type': 'application/json',
    //           'Authorization': 'key='
    //         }
    //       );
    //     } catch (e) {

    //     }
    //   }
    // }
