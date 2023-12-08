import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:const LoginPage() ,
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        LoginPage.routeName: (context) => const LoginPage(),
      },
      initialRoute: Homepage.routeName,
    );
  }
}
