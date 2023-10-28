import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //password showing boolean
  bool isObscure = true;

  //function to show or hide password
  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    //screen size
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    //constants
    double padding = 16.0;
    double lFontSize = 40.0;
    double gap = 30;
    double sFontSize = 16;
    Color fontColor = const Color.fromRGBO(151, 150, 161, 1);
    Color fontColor2 = const Color.fromRGBO(91, 91, 94, 1);
    Color lineColor = const Color.fromRGBO(179, 179, 179, 0.5);
    double sGap = 10;
    double fieldHeight = height * 0.1;
    double lGap = 70.0;
    double buttonHeight = 60;
    double buttonWidth = 248;
    Color buttonColor = const Color.fromRGBO(254, 114, 76, 1);
    double lineHeight = 2;
    double lineWidth = 100;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: -5,
                  left: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(254, 114, 76, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: -80,
                  left: 14,
                  child: Container(
                    width: 165,
                    height: 165,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 236, 231, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: -48,
                  left: 300,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(254, 114, 76, 1),
                    ),
                  ),
                ),
                SafeArea(
                  child: Form(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: lGap,),
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
                              padding: EdgeInsets.only(left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: CustomField(
                                    hintText: "Your email or phone",
                                  )),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "Password",
                                style: TextStyle(color: fontColor, fontSize: sFontSize),
                              ),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: CustomField(
                                    hintText: "Password",
                                    obscureText: isObscure ? true : false,
                                    suffixIcon: IconButton(
                                        onPressed: () => showPass(),
                                        icon: isObscure
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                  )),
                            ),
                            SizedBox(
                              height: lGap,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: const CustomButton(
                            text: 'LOGIN',
                          ),
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: fontColor2, fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: buttonColor),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: lineColor,
                              height: lineHeight,
                              width: lineWidth,
                            ),
                            Text(
                              "Sign in with",
                              style: TextStyle(
                                  color: fontColor2, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              color: lineColor,
                              height: lineHeight,
                              width: lineWidth,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FBButton(),
                            GoogleButton()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
