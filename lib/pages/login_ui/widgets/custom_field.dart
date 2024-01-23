import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  int? maxLength;
  Widget? suffixIcon;
  bool obscureText;
  TextStyle? textStyle;
  TextInputType? textInputType;
  TextAlign textAlign;
  final String? Function(String?) validator;

  CustomField(
      {super.key,
      this.hintText,
      this.controller,
      this.maxLength,
      this.suffixIcon,
      required this.validator,
      this.obscureText = false,
      this.textStyle,
      this.textInputType,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    //constants
    Color hintFontColor = const Color.fromRGBO(196, 196, 196, 1);
    Color borderColor = const Color.fromRGBO(254, 114, 76, 1);
    double radius = 10;
    return TextFormField(
      style: textStyle,
      keyboardType: textInputType,
      validator: validator,
      textAlign: textAlign,
      obscureText: obscureText,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
          counterText: '',
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: hintFontColor, fontFamily: 'SofiaPro'),
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
