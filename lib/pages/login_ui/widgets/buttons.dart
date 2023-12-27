import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, this.onPressed, this.leadingIcon});

  final String text;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    //constants
    double buttonRadius = 28.5;
    Color buttonColor = const Color.fromRGBO(254, 114, 76, 1);
    double fontSize = 15;
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius))),
            backgroundColor: MaterialStatePropertyAll(buttonColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null)
              Icon(
                leadingIcon,
                color: Colors.white,
              ),
            if (leadingIcon != null)
              SizedBox(
                width: 10,
              ),
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'SofiaPro',
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ));
  }
}

class FBButton extends StatelessWidget {
  const FBButton({super.key});

  @override
  Widget build(BuildContext context) {
    //width
    double buttonWidth = 175;
    return InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          'assets/images/FB.svg',
          width: buttonWidth,
        ));
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    //width
    double buttonWidth = 150;
    return InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          'assets/images/google.svg',
          width: buttonWidth,
        ));
  }
}

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: const Icon(Icons.chevron_left)),
    );
  }
}
