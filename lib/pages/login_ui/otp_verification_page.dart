import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';
import 'package:huls_coffee_house/pages/login_ui/signup_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({
    super.key,
    // required this.email,
    // required this.password,
  });

  static const String routeName = '/otpPage';

  // final String email;
  // final String password;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  late String otp;
  bool isUserCreated = false;

  // var otpController = Get.put(OtpController());

  void getOTP(String code) {
    otp = code;
  }

  void validateOtp() {
    print("entering otp validate function");
    var user;
    showLoadingOverlay(
      context: context,
      asyncTask: () async {
        try {
          print("otp authentication started... The otp entered is $otp");
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: SignupPage.verifyId, smsCode: otp);
          print(credential);
          // if (SignupPage.verifyId != otp) {
          //   throw Exception("Wrong OTP, please try again");
          // }
          print("otp completed");
          print("entering user creation protocol...");
          user = await UserController.create(UserModel(
            name: SignupPage.name,
            email: SignupPage.email,
            password: SignupPage.password,
            phone: num.parse(SignupPage.phone),
          ));
          isUserCreated = true;
        } catch (error) {
          // Failed login
          toastMessage(error.toString());
        }
      },
      onCompleted: () {
        if (isUserCreated) {
          if (user != null) {
            Navigator.pushNamedAndRemoveUntil(
                context, Homepage.routeName, (route) => false);
          }
        }
      },
    );
  }

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (var i = 0; i < 6; i++)
                                SizedBox(
                                  width: 50,
                                  child: OTPField(
                                    getOTP: getOTP,
                                    counter: i,
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
                                    fontFamily: 'SofiaPro',
                                    color: fontColor2,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                  onPressed: () {},
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
