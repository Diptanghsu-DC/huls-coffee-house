import 'dart:math';

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/utils/authenticator.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';

import '../../../config/config.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';

class ForgotAlert extends StatefulWidget {
  const ForgotAlert({
    super.key,
  });

  static String forgotOtp = "";
  static String emailEntered = "";

  @override
  State<ForgotAlert> createState() => _ForgotAlertState();
}

class _ForgotAlertState extends State<ForgotAlert> {
  final TextEditingController _emailController = TextEditingController();

  bool isAvailable = false;

  String _generateRandomOtp(int length) {
    final random = Random();
    return List.generate(length, (index) => random.nextInt(10)).join();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Forgot Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Enter your registered email address'),
          const SizedBox(height: 10),
          CustomField(
            // obscureText: hidePassword,
            controller: _emailController,
            validator: (value) {
              return null;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            List<UserModel> user = [];
            showLoadingOverlay(
                context: context,
                asyncTask: () async {
                  user = await UserController.get(
                    email: _emailController.text.trim(),
                    keepPassword: true,
                    forceGet: true,
                  ).first;
                  isAvailable = user.isNotEmpty;
                },
                onCompleted: () {
                  BuildContext dialogContext = context;

                  if (isAvailable) {
                    ForgotAlert.forgotOtp += _generateRandomOtp(6);
                    Authenticator().sendEmailOtp(ForgotAlert.forgotOtp,
                        _emailController.text.trim(), user[0].phone.toString());
                    ForgotAlert.emailEntered +=
                        _emailController.text.toString().trim();
                    Navigator.pushNamed(context, OtpVerificationPage.routeName);
                  } else {
                    if (!dialogContext.mounted) return;
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Email not found. Please Sign Up")));
                  }
                });
          },
          child: const Text('Proceed', style: TextStyle(color: orange)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
