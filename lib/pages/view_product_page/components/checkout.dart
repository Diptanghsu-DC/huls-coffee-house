import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class checkout extends StatelessWidget {
  const checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return 
    Container(
      alignment: Alignment.center,
      width: width * 0.930,
      height: height * 0.063,
      decoration: ShapeDecoration(
        color: Color(0xFFFE724C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Checkout Now',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Sofia Pro',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}
