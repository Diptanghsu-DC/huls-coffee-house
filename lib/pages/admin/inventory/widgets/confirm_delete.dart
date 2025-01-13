import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/services.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/utils/utils.dart';

// import '../../../config/config.dart';
// import '../../../controllers/controllers.dart';
// import '../../../models/models.dart';
// import '../../../utils/utils.dart';
// import '../../pages.dart';

class ConfirmDelProduct extends StatefulWidget {
  final ProductModel? product;
  const ConfirmDelProduct({super.key, this.product});

  @override
  State<ConfirmDelProduct> createState() => _ConfirmDelProductState();
}

class _ConfirmDelProductState extends State<ConfirmDelProduct> {
  final TextEditingController _passController = TextEditingController();

  bool hidePassword = true;
  IconData passVisibility = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Product Deletion'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Enter your password to delete:'),
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
                          await ProductController.delete(widget.product!);
                        },
                        onCompleted: () {
                          if (!dialogContext.mounted) return;
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Product Deleted!")));
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
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
