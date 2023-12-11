import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/signup_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //password showing boolean
  bool isObscure = true;

  //form variables
  final _formKey = GlobalKey<FormState>();
  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  //function to validate form
  void validate() {
    if (_formKey.currentState!.validate()) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter the proper credentials")));
    }
  }

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
                      key:_formKey,
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
                                      fontWeight: FontWeight.w500),
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
                                      controller: passController,
                                      hintText: "Password",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "password cannot be empty";
                                        } else if (value.length < 6) {
                                          return "password must be atleast 6 characters long";
                                        }
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
                                height: lGap,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child: CustomButton(
                              onPressed: validate,
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
                                    fontWeight: FontWeight.w500),
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
