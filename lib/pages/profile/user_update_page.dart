import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';

import '../../widgets/widgets.dart';
import '../login_ui/widgets/buttons.dart';
import '../login_ui/widgets/custom_field.dart';

class UserUpdatePage extends StatefulWidget {
  const UserUpdatePage({super.key});

  @override
  State<UserUpdatePage> createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  //password showing boolean
  bool isObscure = true;

  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  //form variable
  final _formKey = GlobalKey<FormState>();

  //controllers
  // final controller = Get.put(SignUpController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  TextEditingController countryCode = TextEditingController();

  void init() {
    nameController.text = UserController.currentUser!.name;
    emailController.text = UserController.currentUser!.email;
    phoneController.text = UserController.currentUser!.phone.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void saveUpdates() async {
    if (_formKey.currentState!.validate()) {
      showLoadingOverlay(
        context: context,
        asyncTask: () async{
          UserController.currentUser = UserController.currentUser?.copyWith(
            name: nameController.text,
          );
          //await UserController.update;
        },
        onCompleted: () {
          Navigator.pop(context);
        },
      );
    }
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
    double sGap = 10;
    double fieldHeight = height * 0.1;
    double lGap = 70.0;
    double buttonHeight = 60;
    double buttonWidth = 248;
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
                                  "Edit Profile",
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
                                        } else if (value.length < 8) {
                                          return "password must be atleast 8 characters long";
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
                              onPressed: () {},
                              text: 'GET OTP',
                            ),
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          SizedBox(
                            height: sGap,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Container(
                          //       color: lineColor,
                          //       height: lineHeight,
                          //       width: lineWidth,
                          //     ),
                          //     Text(
                          //       "Sign up with",
                          //       style: TextStyle(
                          //           color: fontColor2,
                          //           fontFamily: 'SofiaPro',
                          //           fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
