import 'dart:convert';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:app_settings/app_settings.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:developer' as devtools show log;

class NotificationManager {
  String? token = "";
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

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
    initService();
    initLocalNotifications();
  }

  void requestPermission(FirebaseMessaging fcm) async {
    final settings = await fcm.requestPermission();
    if (kDebugMode) {
      print('Permission granted: ${settings.authorizationStatus}');
    }
  }

  void getToken(FirebaseMessaging fcm) async {
    token = await fcm.getToken();
    if (kDebugMode) {
      print('Registration Token');
      print(token);
    }
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    print("message received");
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print("Background message");
  }

  Future<void> initService() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              _androidChannel.id, _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher'),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (response) {
      final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
      handleMessage(message);
    });
    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<bool> sendPushMessage({
    required String recipientToken,
    required String title,
    required String body,
  }) async {
    final jsonCredentials = await rootBundle
        .loadString('assets/data/hulscoffeehouse-05f7e0fa5aab.json');
    print("step1 complete");
    final creds = auth.ServiceAccountCredentials.fromJson(jsonCredentials);
    print("step2 complete");
    final client = await auth.clientViaServiceAccount(
      creds,
      ['https://www.googleapis.com/auth/cloud-platform'],
    );
    print("step3 complete");
    print("token = ${recipientToken}");
    final notificationData = {
      'message': {
        'token': recipientToken,
        'notification': {'title': title, 'body': body}
      },
    };
    print("step4 complete");
    const String senderId = '704669957190';
    final response = await client.post(
      Uri.parse(
          'https://fcm.googleapis.com/v1/projects/$senderId/messages:send'),
      headers: {
        'content-type': 'application/json',
      },
      body: jsonEncode(notificationData),
    );
    print("step5 complete");
    client.close();
    if (response.statusCode == 200) {
      return true; // Success!
    }
    print(response.statusCode);
    print(response.body);
    devtools.log(
        'Notification Sending Error Response status: ${response.statusCode}');
    devtools.log('Notification Response body: ${response.body}');
    return false;
  }

  // void isTokenRefresh() {
  //   messaging.onTokenRefresh.listen((event) {
  //     event.toString();
  //   });
  // }

  // void foregroundMessage() {
  //   print("entered foreground");
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     if (kDebugMode) {
  //       print('Handling a foreground message: ${message.messageId}');
  //       print('Message data: ${message.data}');
  //       print('Message notification: ${message.notification!.title}');
  //       print('Message notification: ${message.notification!.body}');
  //     }
  //     // showNotifications(message);
  //   });
  // }

  // void initLocalNotifications(BuildContext context, RemoteMessage message) {
  //   var androidInitializationSettings =
  //       const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var iosInitializationSettings = const DarwinInitializationSettings();

  //   var initializationSettings = InitializationSettings(
  //     android: androidInitializationSettings,
  //     iOS: iosInitializationSettings,
  //   );

  //   _flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //   );
  // }

//   Future<void> showNotifications(RemoteMessage message) async {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       Random.secure().nextInt(100000).toString(),
//       'High Importance Channel',
//       importance: Importance.max,
//     );

//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString(),
//       channelDescription: 'your channel description',
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );

//     DarwinNotificationDetails darwinNotificationDetails =
//         const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails,
//     );

//     Future.delayed(
//       Duration.zero,
//       () {
//         _flutterLocalNotificationsPlugin.show(
//           0,
//           message.notification!.title,
//           message.notification!.body,
//           notificationDetails,
//         );
//       },
//     );
//   }
}

NotificationManager notificationManager = NotificationManager();

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
