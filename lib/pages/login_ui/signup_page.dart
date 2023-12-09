import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/login_page.dart';
import 'package:huls_coffee_house/pages/login_ui/otp_verification_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //password showing boolean
  bool isObscure = true;

  //function to show or hide password
  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void navigate() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OtpVerificationPage(),
        ));
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const GoBackButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomBackground(
                  bodyWidget: SafeArea(
                    child: Form(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: lGap * 1.4,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: padding),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: lFontSize,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: padding),
                                child: Text(
                                  "Full Name",
                                  style: TextStyle(
                                      color: fontColor, fontSize: sFontSize),
                                ),
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding, right: padding),
                                child: SizedBox(
                                    height: fieldHeight,
                                    child: CustomField(
                                      hintText: "Your Full Name",
                                      validator: (String) {
                                        return null;
                                      },
                                    )),
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: padding),
                                child: Text(
                                  "E-mail",
                                  style: TextStyle(
                                      color: fontColor, fontSize: sFontSize),
                                ),
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding, right: padding),
                                child: SizedBox(
                                    height: fieldHeight,
                                    child: CustomField(
                                      hintText: "Your email or phone",
                                      validator: (String) {},
                                    )),
                              ),
                              SizedBox(
                                height: gap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: padding),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      color: fontColor, fontSize: sFontSize),
                                ),
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: padding, right: padding),
                                child: SizedBox(
                                    height: fieldHeight,
                                    child: CustomField(
                                      hintText: "Password",
                                      obscureText: isObscure ? true : false,
                                      suffixIcon: IconButton(
                                          onPressed: () => showPass(),
                                          icon: isObscure
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off)),
                                      validator: (String) {},
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
                            child: CustomButton(
                              onPressed: navigate,
                              text: 'GET OTP',
                            ),
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                    color: fontColor2,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage(),
                                        ));
                                  },
                                  child: Text(
                                    "Login",
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
                                "Sign up with",
                                style: TextStyle(
                                    color: fontColor2,
                                    fontWeight: FontWeight.w500),
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
                            children: [FBButton(), GoogleButton()],
                          )
                        ],
                      ),
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
