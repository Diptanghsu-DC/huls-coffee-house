import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

Future<bool> showConfirmWarning(BuildContext context, bool isDone) async {
  bool choice = false;
  // if (Navigator.canPop(context)) {
  //   Navigator.pop(context);
  // } else {
  await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: !isDone
                ? const Text(
                    "Do you want to Notify the Customer ?",
                    style: TextStyle(
                        fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
                  )
                : const Text(
                    "Do you want to mark this order DONE ?",
                    style: TextStyle(
                        fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
                  ),
            actions: [
              TextButton(
                  onPressed: () {
                    choice = false;
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SofiaPro',
                        fontWeight: FontWeight.bold),
                  )),
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
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SofiaPro',
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
            alignment: Alignment.center,
            actionsAlignment: MainAxisAlignment.spaceEvenly,
          ));
  // }
  return choice;
}
