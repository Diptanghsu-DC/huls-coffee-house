import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Addtocart extends StatelessWidget {
  
  const Addtocart({super.key});

  @override
  Widget build(BuildContext context) {
     final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Container(
    width: width*0.4638,
    height: height*0.06625,
    child: Stack(
        children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                    width: width*0.4638,
                    height: height*0.06625,
                    decoration: ShapeDecoration(
                        color: Color(0xFFFE724C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.50),
                        ),
                        shadows: [
                            BoxShadow(
                                color: Color(0x33FE724C),
                                blurRadius: 30,
                                offset: Offset(0, 10),
                                spreadRadius: 0,
                            )
                        ],
                    ),
                ),
            ),
            Positioned(
                left: 6,
                top: 6,
                child: Container(
                    width: width*0.111,
                    height: height*0.05,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                    ),
                ),
                
            ),
            Text(
    'Add to cart ',
    style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'Sofia Pro',
        fontWeight: FontWeight.w400,
        height: 0,
    ),
)
            
        ],
        
    ),
    
);
  }
}