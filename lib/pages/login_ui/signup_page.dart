import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';
import 'package:huls_coffee_house/pages/login_ui/login_page.dart';
import 'package:huls_coffee_house/pages/login_ui/otp_verification_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/utils/toast_message.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  static const String routeName = '/signUpPage';

  static String verifyId = "";
  static String email = "";
  static String password = "";
  static String name = "";
  static String phone = "";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //password showing boolean
  bool isObscure = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //form variable
  final _formKey = GlobalKey<FormState>();

  //controllers
  // final controller = Get.put(SignUpController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  TextEditingController countryCode = TextEditingController();

  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  //function to validate form
  void validate() {
    if (_formKey.currentState!.validate()) {
      print("entering validate function");
      showLoadingOverlay(
        context: context,
        asyncTask: () async {
          try {
            await _auth.verifyPhoneNumber(
              phoneNumber: countryCode.text + phoneController.text,
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {},
              codeSent: (String verificationId, int? resendToken) {
                print("code sent. setting parameters...");
                SignupPage.verifyId = verificationId;
                SignupPage.email = emailController.text.toString();
                SignupPage.password = passController.text.toString();
                SignupPage.name = nameController.text.toString();
                SignupPage.phone = phoneController.text.toString();
                print("parameters set");
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          } catch (error) {
            // Failed login
            toastMessage(error.toString());
          }
        },
        onCompleted: () {
          Navigator.pushNamedAndRemoveUntil(
              context, OtpVerificationPage.routeName, (route) => false);
        },
      );
    } else {
      toastMessage("Please enter proper credentials");
    }
  }

  //function to show or hide password
  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
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
                      key: _formKey,
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SofiaPro'),
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
                                      color: fontColor,
                                      fontSize: sFontSize,
                                      fontFamily: 'SofiaPro'),
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
                                      controller: nameController,
                                      hintText: "Your Full Name",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Name cannot be empty";
                                        }
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
                                      fontFamily: 'SofiaPro',
                                      color: fontColor,
                                      fontSize: sFontSize),
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
                                      controller: emailController,
                                      hintText: "Your email",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "email cannot be empty";
                                        }
                                        return null;
                                      },
                                    )),
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: padding),
                                child: Text(
                                  "Phone",
                                  style: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: fontColor,
                                      fontSize: sFontSize),
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
                                      controller: phoneController,
                                      hintText: "Your phone number",
                                      textInputType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "phone number cannot be empty";
                                        }
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
                                  "Password",
                                  style: TextStyle(
                                      fontFamily: 'SofiaPro',
                                      color: fontColor,
                                      fontSize: sFontSize),
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
                                      controller: passController,
                                      hintText: "Password",
                                      obscureText: isObscure ? true : false,
                                      suffixIcon: IconButton(
                                          onPressed: () => showPass(),
                                          icon: isObscure
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                              Icons.visibility_off)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "password cannot be empty";
                                        } else if (value.length < 6) {
                                          return "password must be atleast 6 characters long";
                                        }
                                        return null;
                                      },
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
                              onPressed: validate,
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
                                    fontFamily: 'SofiaPro',
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
                                    style: TextStyle(
                                        color: buttonColor,
                                        fontFamily: 'SofiaPro'),
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
                                    fontFamily: 'SofiaPro',
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