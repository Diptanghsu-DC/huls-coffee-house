import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';

import '../../../config/config.dart';
import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../pages.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({
    super.key,
    required this.changePermit,
  });
  final Function changePermit;

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final TextEditingController _passController = TextEditingController();

  bool hidePassword = true;
  IconData passVisibility = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Enter your current password to continue:'),
          const SizedBox(height: 10),
          CustomField(
            obscureText: hidePassword,
            controller: _passController,
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
                  if (Encryptor.isValid(user.first.password, enteredPassword)) {
                    showLoadingOverlay(
                      context: context,
                      asyncTask: () async {
                        widget.changePermit();
                      },
                      onCompleted: () {
                        Navigator.pop(dialogContext);
                      },
                    );
                  } else {
                    if (!dialogContext.mounted) return;
                    Navigator.of(dialogContext).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invalid Password")));
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
