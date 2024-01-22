import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

class SideMenuCard extends StatelessWidget {
  final IconData iconname;
  final String title;

  const SideMenuCard({
    super.key,
    required this.iconname,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03),
      child: Container(
        width: width * 0.552,
        height: height * 0.073,
        decoration: ShapeDecoration(
          color: orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 3,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.02,
            ),
            Icon(
              iconname,
              color: Colors.white,
            ),
            SizedBox(
              width: width * 0.06,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'SofiaPro',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
