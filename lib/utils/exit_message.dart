import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

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
                    child: const Text("No",style: TextStyle(
                      color: Colors.black
                    ),)),
                Container(
                  decoration: BoxDecoration(
                      color: orange, borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        choice = true;
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
              alignment: Alignment.center,
              actionsAlignment: MainAxisAlignment.spaceEvenly,
            ));
  }
  return choice;
}
