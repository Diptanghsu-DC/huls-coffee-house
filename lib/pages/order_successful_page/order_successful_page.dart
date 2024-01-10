import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';

class OrderSuccessfulPage extends StatefulWidget {
  static const String routeName = '/orderSuccessfulPage';

  const OrderSuccessfulPage({super.key});

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (UserController.currentUser != null) {
      Timer(Duration(seconds: 5), () {
        Navigator.pushNamedAndRemoveUntil(
            context, Homepage.routeName, (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Yayy!",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SofiaPro',
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              "Order Placed Successfully",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'SofiaPro',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(shape: BoxShape.circle, color: orange),
              child: Center(
                child: Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Text(
              "Thank You!",
              style: TextStyle(
                color: orange,
                fontStyle: FontStyle.italic,
                fontFamily: 'SofiaPro',
                fontSize: 30,
              ),
            ),
          ].separate(10),
        ),
      ),
    );
  }
}
