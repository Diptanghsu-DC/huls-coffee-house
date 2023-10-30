import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';

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
                //abstract circles portion to be reused in other pages
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
                            OTPFIeld(),
                            OTPFIeld(),
                            OTPFIeld(),
                            OTPFIeld(),
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
                            text: 'GET OTP',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
