import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/pages/profile/utils/pass_change_notifier.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class NewPassPage extends StatefulWidget {
  const NewPassPage({super.key});

  static const String routeName = "/newPass";

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  bool isObscure = true;

  final TextEditingController passChangeController = TextEditingController();
  final TextEditingController confirmChangeController =
  TextEditingController();

  final formKey = GlobalKey<FormState>();

  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void saveUpdates() async {
    if (formKey.currentState!.validate()) {
      showLoadingOverlay(
        context: context,
        asyncTask: () async {
          UserModel? oldUser = UserController.currentUser;
          UserController.currentUser = UserController.currentUser?.copyWith(
            name: oldUser!.name,
            email: oldUser.email,
            password: passChangeController.text,
            phone: oldUser.phone,
          );
          await UserController.update(oldUser: oldUser);
          await PassChangeNotifier()
              .sendEmailVer(UserController.currentUser!.email);
        },
        onCompleted: () {
          Navigator.pop(context);
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
                                    obscureText: isObscure ? true : false,
                                    suffixIcon: IconButton(
                                        onPressed: () => showPass(),
                                        icon: isObscure
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
                                  obscureText: isObscure ? true : false,
                                  suffixIcon: IconButton(
                                      onPressed: () => showPass(),
                                      icon: isObscure
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
