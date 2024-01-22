import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';
import 'package:huls_coffee_house/pages/admin/main_page/main_page.dart';
import 'package:huls_coffee_house/pages/login_ui/signup_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/forgot_alert.dart';
import 'package:huls_coffee_house/pages/main_page/main_page.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUserLogged = false;

  //password showing boolean
  bool isObscure = true;

  //form variables
  final _formKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  //function to validate form
  void validate(BuildContext context) {
    var user;
    if (_formKey.currentState!.validate()) {
      showLoadingOverlay(
        context: context,
        asyncTask: () async {
          try {
            user = await UserController.login(
                email: emailController.text.toString(),
                password: passController.text.toString());
            isUserLogged = true;
          } catch (error) {
            // Failed login
            toastMessage(error.toString());
          }
        },
        onCompleted: () {
          if (isUserLogged) {
            if (user != null) {
              if (UserController.currentUser!.isSeller) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AdminMainPage.routeName, (route) => false);
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainPage.routeName,
                  (route) => false,
                );
              }
            }
          }
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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool shouldPop = await showExitWarning(context);
        if (shouldPop) {
          navigator.pop();
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: const GoBackButton(),
        body: Builder(builder: (BuildContext context) {
          return SingleChildScrollView(
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
                                      "Login",
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
                                      "E-mail",
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
                                          controller: emailController,
                                          hintText: "Your email or phone",
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "email or phone number cannot be empty";
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
                                          controller: passController,
                                          hintText: "Password",
                                          validator: (value) {
                                            // if (value!.isEmpty) {
                                            //   return "password cannot be empty";
                                            // }
                                            return null;
                                          },
                                          obscureText: isObscure ? true : false,
                                          suffixIcon: IconButton(
                                              onPressed: () => showPass(),
                                              icon: isObscure
                                                  ? const Icon(Icons.visibility)
                                                  : const Icon(
                                                      Icons.visibility_off)),
                                        )),
                                  ),
                                  SizedBox(
                                    height: sGap,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: padding),
                                    child: TextButton(
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const ForgotAlert(),
                                      ),
                                      child: Text(
                                        "Forgot Password ?",
                                        style: TextStyle(
                                            color: orange,
                                            fontSize: sFontSize,
                                            fontFamily: 'SofiaPro'),
                                      ),
                                    ),
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
                                  onPressed: () => validate(context),
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
                                        color: fontColor2,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'SofiaPro'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupPage(),
                                            ));
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: buttonColor,
                                            fontFamily: 'SofiaPro'),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: sGap,
                              ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Container(
                              //       color: lineColor,
                              //       height: lineHeight,
                              //       width: lineWidth,
                              //     ),
                              //     Text(
                              //       "Sign in with",
                              //       style: TextStyle(
                              //           color: fontColor2,
                              //           fontWeight: FontWeight.w500,
                              //           fontFamily: 'SofiaPro'),
                              //     ),
                              //     Container(
                              //       color: lineColor,
                              //       height: lineHeight,
                              //       width: lineWidth,
                              //     ),
                              //   ],
                              // ),
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
          );
        }),
      ),
    );
  }
}
