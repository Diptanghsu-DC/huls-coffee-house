import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastMessage(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
  // Fluttertoast.showToast(
  //   msg: message,
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.BOTTOM,
  //   timeInSecForIosWeb: 1,
  //   fontSize: 16,
  //   backgroundColor: Colors.red,
  //   textColor: Colors.white,
  // );
}
