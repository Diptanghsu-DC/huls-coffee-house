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

class OTPField extends StatefulWidget {
  const OTPField({Key? key, required this.counter, required this.getOTP})
      : super(key: key);
  final counter;
  final Function(String) getOTP;

  @override
  _OTPFieldState createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  static String otp = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_controller.text.length == 1) {
      otp += _controller.text;
      if (widget.counter == 5) {
        widget.getOTP(otp);
        return;
      }
      if (_focusNode.hasFocus) {
        _focusNode.nextFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color.fromRGBO(254, 114, 76, 1);
    return Container(
      height: 65,
      width: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: borderColor,
            fontSize: 27.5,
            fontWeight: FontWeight.bold,
            fontFamily: 'SofiaPro'),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          counter: Offstage(),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            _focusNode.previousFocus();
          }
        },
      ),
    );
  }
}
