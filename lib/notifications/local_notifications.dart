import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalNotification {
  static bool didInit = false;

  const LocalNotification._();

  static Future<void> _handlerPermission() async {
    if (await Permission.notification.isGranted == false) {
      await Permission.notification.request();
    }
  }

  static Future<void> _init() async {
    if (didInit) return;
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    didInit = true;
  }

  static Future<void> sendNotification(int id, String channelID,
      String channelName, String title, String body) async {
    await _init();
    await _handlerPermission();
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channelID,
      channelName,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }
}
