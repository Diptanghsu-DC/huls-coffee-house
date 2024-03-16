import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/admin/main_page/main_page.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/order_history.dart';
import 'package:huls_coffee_house/pages/main_page/main_page.dart';
import 'package:huls_coffee_house/utils/utils.dart';

import '../../controllers/services/user/user_controller.dart';
import '../../firebase_options.dart';
import '../../utils/local_database/local_database.dart';
import '../pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

// used to pass messages from event handler to the UI
final _messageStreamController = BehaviorSubject<RemoteMessage>();

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  //route
  static const String routeName = "/splashscreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _lastMessage = "";

  // NotificationManager notificationManager = NotificationManager();

  // _SplashScreenState() {
  //   _messageStreamController.listen((message) {
  //     setState(() {
  //       if (message.notification != null) {
  //         _lastMessage = 'Received a notification message:'
  //             '\nTitle=${message.notification?.title},'
  //             '\nBody=${message.notification?.body},'
  //             '\nData=${message.data}';
  //       } else {
  //         _lastMessage = 'Received a data message: ${message.data}';
  //       }
  //     });
  //   });
  // }

  //function to handle background messages
  // Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   await Firebase.initializeApp();

  //   if (kDebugMode) {
  //     print("Handling a background message: ${message.messageId}");
  //     print('Message data: ${message.data}');
  //     print('Message notification: ${message.notification?.title}');
  //     print('Message notification: ${message.notification?.body}');
  //   }
  // }

  // Function to process all async functions
  Future<int> init() async {
    Stopwatch stopwatch = Stopwatch()..start();
    await dotenv.load(fileName: '.env');
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    //TODO: initialise local database
    await LocalDatabase.init();

    //TODO: login the user silently
    await UserController.loginSilently().last;

    NotificationManager().init();

    LogOrder.init();

    stopwatch.stop();
    return stopwatch.elapsed.inMilliseconds;
  }

  @override
  void initState() {
    super.initState();
    init().then((duration) {
      debugPrint("Successfully completed all async tasks");
      debugPrint("Time taken: $duration ms");
      if (UserController.currentUser == null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(
                LoginPage.routeName, (Route<dynamic> route) => false)
            .then((value) => exit(0));
      } else {
        if (UserController.currentUser!.isSeller) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(
                  AdminMainPage.routeName, (route) => false)
              .then((value) => exit(0));
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(MainPage.routeName, (route) => false)
              .then((value) => exit(0));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Scaffold(
      body: SizedBox(
        width: width,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/Blue_and_White_Circle_Surfing_Club_Logo-removebg-preview (1).png"),
                CircularProgressIndicator(
                  color: orange,
                )
              ],
            ),
            Positioned(
                bottom: 20,
                child: SizedBox(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Developed by",
                        style: TextStyle(fontFamily: 'SofiaPro'),
                      ),
                      Image.asset(
                        "assets/images/ecell_logo.png",
                        height: 100,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
