import 'package:flutter/material.dart';

class SideMenuCrad extends StatelessWidget {
  final String iconname;
  final String title;
  final VoidCallback ontap;
  const SideMenuCrad(
      {super.key,
      required this.iconname,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(bottom: height * 0.003),
        child: Container(
          width: width * 0.552,
          height: height * 0.073,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
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
              Image.asset('assets/icons/$iconname.png'),
              SizedBox(
                width: width * 0.06,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3F434A),
                  fontSize: 13,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
