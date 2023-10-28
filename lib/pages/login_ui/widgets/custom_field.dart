import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  int? maxLength;
  Widget? suffixIcon;
  bool obscureText;

  CustomField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLength,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    //constants
    Color hintFontColor = const Color.fromRGBO(196, 196, 196, 1);
    Color borderColor = const Color.fromRGBO(254, 114, 76, 1);
    double radius = 10;
    return TextField(
      obscureText: obscureText,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: hintFontColor),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: hintFontColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(radius))),
    );
  }
}
