import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  Widget build(BuildContext context) {
    //screen size
    //constants
    double lFontSize = 40.0;
    double sFontSize = 16;
    Color fontColor = const Color.fromRGBO(151, 150, 161, 1);
    Color fontColor2 = const Color.fromRGBO(91, 91, 94, 1);
    double sGap = 10;
    double lGap = 70.0;
    double buttonHeight = 60;
    double buttonWidth = 248;
    Color buttonColor = const Color.fromRGBO(254, 114, 76, 1);
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: lGap * 1.4,
                              ),
                              Text(
                                "Verification Code",
                                style: TextStyle(
                                    fontSize: lFontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              Text(
                                "Please type the verification code",
                                style: TextStyle(
                                    color: fontColor, fontSize: sFontSize),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (var i = 0; i < 4; i++)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: SizedBox(
                                    width: 50,
                                    child: OTPField(),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive a code?",
                                style: TextStyle(
                                    color: fontColor2,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                  autofocus: false,
                                  onPressed: () {},
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(color: buttonColor),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child: const CustomButton(
                              text: 'SIGN UP',
                            ),
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          SizedBox(
                            height: sGap,
                          ),
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
