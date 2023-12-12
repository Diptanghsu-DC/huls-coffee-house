import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              const TextTheme(bodySmall: TextStyle(fontFamily: 'SofiaPro'))),
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        LoginPage.routeName: (context) => const LoginPage(),
        Cart.routeName: (context) => const Cart(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}
