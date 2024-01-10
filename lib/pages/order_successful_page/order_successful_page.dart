import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';

class OrderSuccessfulPage extends StatefulWidget {
  static const String routeName = '/orderSuccessfulPage';

  const OrderSuccessfulPage({Key? key}) : super(key: key);

  @override
  State<OrderSuccessfulPage> createState() => _OrderSuccessfulPageState();
}

class _OrderSuccessfulPageState extends State<OrderSuccessfulPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (UserController.currentUser != null) {
      _animationController.forward();
      Timer(Duration(seconds: 4), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Homepage.routeName,
              (route) => false,
        );
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Yayy!",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SofiaPro',
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Order Placed Successfully",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SofiaPro',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return ScaleTransition(
                  scale: _scaleAnimation.drive(
                    CurveTween(curve: Curves.easeInOutBack),
                  ),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: orange,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.done_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: Text(
                "Thank You!",
                style: TextStyle(
                  color: orange,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SofiaPro',
                  fontSize: 30,
                ),
              ),
            ),
          ].separate(10),
        ),
      ),
    );
  }
}
