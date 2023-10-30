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

  CustomField(
      {super.key,
      this.hintText,
      this.controller,
      this.maxLength,
      this.suffixIcon,
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
    return TextField(
      style: textStyle,
      keyboardType: textInputType,
      textAlign: textAlign,
      obscureText: obscureText,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
          counterText: '',
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

class OTPFIeld extends StatelessWidget {
  const OTPFIeld({super.key});

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color.fromRGBO(254, 114, 76, 1);
    return Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CustomField(
          textAlign: TextAlign.center,
          maxLength: 1,
          textInputType: TextInputType.number,
          textStyle: TextStyle(
              color: borderColor, fontSize: 27.5, fontWeight: FontWeight.bold),
        ));
  }
}
