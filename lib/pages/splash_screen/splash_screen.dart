import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/admin/main_page/main_page.dart';
import 'package:huls_coffee_house/pages/main_page/main_page.dart';

import '../../controllers/services/user/user_controller.dart';
import '../../firebase_options.dart';
import '../../utils/local_database/local_database.dart';
import '../pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  //route
  static const String routeName = "/splashscreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Function to process all async functions
  Future<int> init() async {
    Stopwatch stopwatch = Stopwatch()..start();
    await dotenv.load(fileName: '.env');
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    // TODO: Request permission

    // TODO: Register with FCM
    // TODO: Set up foreground message handler
    // TODO: Set up background message handler
    await LocalDatabase.init();
    await UserController.loginSilently().last;
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
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: orange,
        ),
      ),
    );
  }
}
