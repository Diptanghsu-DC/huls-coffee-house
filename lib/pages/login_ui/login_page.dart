import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //screen size
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    //constants
    double padding = 16.0;
    double lFontSize = 40.0;
    double gap = 30;
    double sFontSize = 16;
    Color fontColor = const Color.fromRGBO(151, 150, 161, 1);
    double sGap = 10;
    double fieldHeight = height * 0.1;
    double fieldWidth = width * 0.9;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: padding),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: lFontSize, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: gap,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding),
                  child: Text(
                    "E-mail",
                    style: TextStyle(color: fontColor, fontSize: sFontSize),
                  ),
                ),
                SizedBox(
                  height: sGap,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding),
                  child: SizedBox(
                    height: fieldHeight,
                    width: fieldWidth,
                    child: TextField(
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1)),
                          hintText: "Your email or phone",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 0.5,
                                  color: Color.fromRGBO(238, 238, 238, 1)))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
