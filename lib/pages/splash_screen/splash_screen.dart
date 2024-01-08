import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        Navigator.of(context)
            .pushNamedAndRemoveUntil(
                Homepage.routeName, (Route<dynamic> route) => false)
            .then((value) => exit(0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
