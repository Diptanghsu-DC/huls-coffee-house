import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huls_coffee_house/pages/login_ui/login_page.dart';
import 'package:huls_coffee_house/pages/viewproduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ViewProduct() ,
    );
  }
}
