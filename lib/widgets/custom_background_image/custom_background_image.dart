import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.bodyWidget});
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    //abstract circles portion to be reused in other pages
    return Stack(
      children: [
        Positioned(
          top: -5,
          left: -30,
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(254, 114, 76, 1),
            ),
          ),
        ),
        Positioned(
          top: -80,
          left: 14,
          child: Container(
            width: 165,
            height: 165,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 236, 231, 1),
            ),
          ),
        ),
        Positioned(
          top: -48,
          left: 300,
          child: Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(254, 114, 76, 1),
            ),
          ),
        ),
        bodyWidget,
      ],
    );
  }
}
