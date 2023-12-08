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

class OTPField extends StatefulWidget {
  const OTPField({Key? key}) : super(key: key);

  @override
  _OTPFieldState createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

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
      _focusNode.nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color.fromRGBO(254, 114, 76, 1);
    return Container(
      height: 65,
      width: 65,
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
        ),
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
