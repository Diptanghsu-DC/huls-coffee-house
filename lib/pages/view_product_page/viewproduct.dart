import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/addons.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/checkout.dart';


class ViewProduct extends StatelessWidget {
  const ViewProduct({super.key});
  static const String routeName = '/viewproduct';

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(width * 0.0555555555555556,
                  height * 0.0625, width * 0.0555555555555556, 0),
              height: height * 0.2575,
              width: width * 0.897,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage('assets/images/image 10.png'),
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            width: 319,
            child: Text(
              'Bday cake 1',
              style: TextStyle(
                color: Color(0xFF323643),
                fontSize: 28,
                fontFamily: 'Sofia Pro',
                fontWeight: FontWeight.w400,
                height: 0.04,
                letterSpacing: -0.56,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.055, height * 0.05625,
                width * 0.028, height * 0.03375),
            child: Row(
              children: [
                Text(
                  '\$450',
                  style: TextStyle(
                    color: Color(0xFFFE724C),
                    fontSize: 17.01,
                    fontFamily: 'Sofia Pro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: width * 0.421,
                ),
                Container(
                  width: 30.60,
                  height: 30.60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 30.60,
                          height: 30.60,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFFE724C)),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0xFFEEF0F2),
                                blurRadius: 30,
                                offset: Offset(0, 20),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9.90,
                        top: 15.79,
                        child: Container(
                          width: 10.80,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.50,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFFE724C),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.1091388888888889,
                ),
                Text(
                  '01',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Sofia Pro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: width * 0.08,
                ),
                Container(
                  width: 30.60,
                  height: 30.60,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 30.60,
                          height: 30.60,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFE724C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x40FE724C),
                                blurRadius: 30,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9.90,
                        top: 9.90,
                        child: Container(
                          width: 10.80,
                          height: 10.80,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 4.91,
                                top: 0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(1.57),
                                  child: Container(
                                    width: 10.80,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.50,
                                          strokeAlign:
                                              BorderSide.strokeAlignCenter,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 5.89,
                                child: Container(
                                  width: 10.80,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.50,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03375,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03055, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  ' Add Ons',
                  style: TextStyle(
                    color: Color(0xFF323643),
                    fontSize: 18,
                    fontFamily: 'Sofia Pro',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          Addons(name: 'Candels',image:'assets/images/demo1.png',price: '+20',),
          Addons(name: 'Sparkels',image:'assets/images/demo2.png',price: '+20',),
          SizedBox(height: height*0.0225,),

checkout(),

SizedBox(height: height*0.1325,),

        ],
        
      ),
    );
  }
}
