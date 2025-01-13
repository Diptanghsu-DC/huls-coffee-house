import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';
import 'package:huls_coffee_house/pages/login_ui/signup_page.dart';
import 'package:huls_coffee_house/pages/login_ui/utils/authenticator.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/forgot_alert.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/new_pass.dart';
import 'package:huls_coffee_house/pages/main_page/main_page.dart';
import 'package:huls_coffee_house/utils/notifications.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    super.key,
  });

  static const String routeName = '/otpPage';

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late String otp;
  bool isUserCreated = false;

  void getOTP(String code) {
    otp = code;
  }

  String _generateRandomOtp(int length) {
    final random = Random();
    return List.generate(length, (index) => random.nextInt(10)).join();
  }

  void validateOtp() {
    print("entering otp validate function");
    var user;
    showLoadingOverlay(
      context: context,
      asyncTask: () async {
        try {
          print("otp authentication started... The otp entered is $otp");
          if (SignupPage.verifyId != otp && ForgotAlert.forgotOtp != otp) {
            throw Exception(
                "Wrong OTP, please remove the current text and try again");
          }
          print("otp completed");
          print("entering user creation protocol...");
          if (ForgotAlert.forgotOtp == "") {
            user = await UserController.create(UserModel(
              deviceToken: notificationManager.token,
              name: SignupPage.name,
              email: SignupPage.email.trim(),
              password: SignupPage.password.trim(),
              phone: num.parse(SignupPage.phone),
              address: SignupPage.address,
            ));
            isUserCreated = true;
          }
        } catch (error) {
          // Failed login
          toastMessage(error.toString(), context);
        }
      },
      onCompleted: () {
        if (isUserCreated) {
          if (user != null) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainPage.routeName, (route) => false);
          }
        } else if (ForgotAlert.forgotOtp == otp) {
          Navigator.pushNamed(context, NewPassPage.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //screen size
    getSize(context);
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
                                    fontFamily: 'SofiaPro',
                                    fontSize: lFontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              Text(
                                "Please type the verification code",
                                style: TextStyle(
                                    fontFamily: 'SofiaPro',
                                    color: fontColor,
                                    fontSize: sFontSize),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          OtpTextField(
                            numberOfFields: 6,
                            fieldWidth: width * 0.135,
                            focusedBorderColor: orange,
                            cursorColor: orange,
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {},
                            onSubmit: (String verificationCode) =>
                                getOTP(verificationCode),

                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Text("Verification Code"),
                            //         content: Text(
                            //             'Code entered is $verificationCode'),
                            //       );
                            //     });
                            // },
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     for (var i = 0; i < 6; i++)
                          //       SizedBox(
                          //         width: 50,
                          //         child: OTPField(
                          //           getOTP: getOTP,
                          //           counter: i,
                          //         ),
                          //       ),
                          //   ],
                          // ),
                          SizedBox(
                            height: sGap,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't receive a code?",
                                style: TextStyle(
                                    fontFamily: 'SofiaPro',
                                    color: fontColor2,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                  onPressed: () {
                                    print("pressed resend");
                                    try {
                                      final String otp = _generateRandomOtp(6);
                                      print(
                                          "email entered is ${SignupPage.email}");
                                      SignupPage.verifyId = otp;
                                      // SignupPage.email =
                                      //     emailController.text.toString();
                                      // SignupPage.password =
                                      //     passController.text.toString();
                                      // SignupPage.name =
                                      //     nameController.text.toString();
                                      // SignupPage.phone =
                                      //     phoneController.text.toString();
                                      Authenticator().sendEmailOtp(otp,
                                          SignupPage.email, SignupPage.phone);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              "Code sent to ${SignupPage.email}! Please check spam folder also"),
                                        ),
                                      );
                                      print("code send $otp");
                                    } catch (error) {
                                      // Failed login
                                      toastMessage(error.toString(), context);
                                    }
                                  },
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                        color: buttonColor,
                                        fontFamily: 'SofiaPro'),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child: CustomButton(
                              text: 'SIGN UP',
                              onPressed: validateOtp,
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
