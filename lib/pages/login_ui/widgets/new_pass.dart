import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/login_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/forgot_alert.dart';
import 'package:huls_coffee_house/pages/profile/utils/pass_change_notifier.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

import '../../../utils/database/constants.dart';
import '../../../utils/utils.dart';

class NewPassPage extends StatefulWidget {
  const NewPassPage({super.key});

  static const String routeName = "/newPass";

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  bool isObscurePass = true;
  bool isObscureConfirm = true;

  final TextEditingController passChangeController = TextEditingController();
  final TextEditingController confirmChangeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void showPass(String controller) {
    setState(() {
      if (controller == "passChangeController") {
        isObscurePass = !isObscurePass;
      } else if (controller == "confirmChangeController") {
        isObscureConfirm = !isObscureConfirm;
      }
    });
  }

  void saveUpdates() async {
    if (formKey.currentState!.validate()) {
      showLoadingOverlay(
        context: context,
        asyncTask: () async {
          List<UserModel?> listUser =
              await UserController.get(email: ForgotAlert.emailEntered.trim())
                  .first;
          UserModel? oldUser = listUser[0];
          UserController.currentUser = oldUser?.copyWith(
            password: passChangeController.text.trim(),
          );
          await UserController.update(oldUser: oldUser);
          await PassChangeNotifier()
              .sendEmailVer(UserController.currentUser!.email);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Confirmation Email Sent"),
            ),
          );
        },
        onCompleted: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
              (route) => false);
        },
      );
    }
  }

  @override
  Widget build(context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

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
        child: Column(children: [
          Stack(
            children: [
              CustomBackground(
                bodyWidget: SafeArea(
                  child: Form(
                    key: formKey,
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
                                "New Password",
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
                                    textInputType: TextInputType.text,
                                    controller: passChangeController,
                                    hintText: "Password",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "password cannot be empty";
                                      }
                                      return null;
                                    },
                                    obscureText: isObscurePass ? true : false,
                                    suffixIcon: IconButton(
                                        onPressed: () =>
                                            showPass("passChangeController"),
                                        icon: isObscurePass
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                  )),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "Confirm Password",
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
                                  controller: confirmChangeController,
                                  hintText: "Confirm Password",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "password cannot be empty";
                                    } else if (value !=
                                        passChangeController.text) {
                                      return "Password and Confirm password must be equal";
                                    }
                                    return null;
                                  },
                                  obscureText: isObscureConfirm ? true : false,
                                  suffixIcon: IconButton(
                                      onPressed: () =>
                                          showPass("confirmChangeController"),
                                      icon: isObscureConfirm
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: lGap,
                        ),
                        SizedBox(
                          height: lGap,
                        ),
                        SizedBox(
                          height: lGap,
                        ),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: CustomButton(
                            onPressed: () {
                              saveUpdates();
                            },
                            text: 'SAVE',
                          ),
                        ),
                        // SizedBox(
                        //   height: sGap,
                        // ),
                        // SizedBox(
                        //   height: sGap,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
    //   ],
    // ),
    // );
  }
}
