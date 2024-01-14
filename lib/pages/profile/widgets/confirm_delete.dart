import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';

import '../../../config/config.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';

class ConfirmDelProfile extends StatefulWidget {
  const ConfirmDelProfile({super.key});

  @override
  State<ConfirmDelProfile> createState() => _ConfirmDelProfileState();
}

class _ConfirmDelProfileState extends State<ConfirmDelProfile> {
  final TextEditingController _passController = TextEditingController();

  bool hidePassword = true;
  IconData passVisibility = Icons.visibility;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text('Confirm Profile Deletion'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Enter your password to delete:'),
          const SizedBox(height: 10),
          CustomField(
            suffixIcon: IconButton(
                onPressed: () {
                  if (passVisibility == Icons.visibility) {
                    setState(() {
                      passVisibility = Icons.visibility_off;
                      hidePassword = false;
                    });
                  } else {
                    setState(() {
                      passVisibility = Icons.visibility;
                      hidePassword = true;
                    });
                  }
                },
                icon: Icon(
                  passVisibility,
                  color: const Color.fromARGB(255, 67, 67, 67),
                )),
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
                    email: UserController.currentUser!.email,
                    keepPassword: true,
                    forceGet: true,
                  ).first;
                },
                onCompleted: () {
                  BuildContext dialogContext = context;
                  String enteredPassword = _passController.text;
                  if (Encryptor.isValid(
                      user.first.password, enteredPassword)) {
                    showLoadingOverlay(
                        context: context,
                        asyncTask: () async {
                          await UserController.delete();
                        },
                        onCompleted: () {
                          if (!dialogContext.mounted) return;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LoginPage.routeName,
                            (route) => false,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Profile Deleted!")));
                        });
                  } else {
                    if (!dialogContext.mounted) return;
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Password")));
                  }
                });
          },
          child: const Text('Confirm', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
