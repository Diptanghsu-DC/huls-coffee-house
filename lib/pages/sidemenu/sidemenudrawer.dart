import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/Sidemenu/sidemenilistclass.dart';
import 'package:huls_coffee_house/pages/Sidemenu/sidemenucard.dart';

Widget buildCustomDrawer(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.06),
        Padding(
          padding: EdgeInsets.only(left: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.277,
                height: height * 0.125,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 3,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Image.asset(
                  'assets/icons/account.png',
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: width * 0.025),
        Padding(
          padding: EdgeInsets.only(left: width * 0.1),
          child: Text(
          // This function should be defined  
          'Username',
            style: TextStyle(
              color: Color(0xFF565656),
              fontSize: 20,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: height * 0.03875),
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.0388),
                child: Container(
                  width: 4,
                  color: Color(0xFFE68969),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.036, right: width * 0.075),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return SideMenuCrad(
                              title: sideMenuItems[index].title,
                              iconname: sideMenuItems[index].iconPath,
                              ontap: sideMenuItems[index].onTap,
                            );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.025);
                    },
                    itemCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.05, top: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                 
                },
                child: Container(
                  width: width * 0.5277,
                  height: height * 0.05875,
                  decoration: ShapeDecoration(
                    color: Color(0xFFF17306),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Out ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.65,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
