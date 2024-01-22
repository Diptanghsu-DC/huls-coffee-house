import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title:${message.notification?.title}');
  print('Body:${message.notification?.body}');
  print('Payload:${message.data}');
}

class Firebaseapi {
  final _firebasemessaging = FirebaseMessaging.instance;
  Future<void> initnotification() async {
    await _firebasemessaging.requestPermission();
    final fcmtoken = await _firebasemessaging.getToken();
    print('Token $fcmtoken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
