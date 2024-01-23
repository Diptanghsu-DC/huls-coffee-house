import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

Future<bool> showLogoutWarning(BuildContext context) async {
  bool choice = false;
  // if (Navigator.canPop(context)) {
  //   Navigator.pop(context);
  // } else {
  await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text(
              "Do you want Log Out?",
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
