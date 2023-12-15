import 'package:flutter/material.dart';

Future<bool?> showExitWarning(BuildContext context) async {
  bool choice = false;
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  } else {
    await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Do you want to exit the app?"),
          actions: [
            TextButton(
                onPressed: () {
                  choice = false;
                  Navigator.pop(context);
                },
                child: const Text("No")),
            TextButton(
                onPressed: () {
                  choice = true;
                  Navigator.pop(context);
                },
                child: const Text("Yes"))
          ],
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
        ));
  }
  return choice;
}
