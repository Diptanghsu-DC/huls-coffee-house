import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Addons extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  final bool addon;
  const Addons(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      required this.addon});

  @override
  State<Addons> createState() => _AddonsState();
}

class _AddonsState extends State<Addons> {
  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(width * 0.01819, height * 0.0060, 0, 0),
      child: Row(
        children: [
          Image.asset(
            widget.image,
            height: height * 0.06,
            width: width * 0.13,
          ),
          SizedBox(
            width: width * 0.0350,
          ),
          Text(
            widget.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          SizedBox(
            width: width * 0.458,
          ),
          Text(
            widget.price,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          // Radio(
          //   value: 0,
          //   groupValue: 0,
          //   onChanged: (value) {},
          //   activeColor: Color(0xffFE724C),
          // )
          Checkbox(
            value: widget.addon,
            onChanged: (value) {
              setState(() {
                
              });
            },
            activeColor: Color(0xffFE724C),
            shape: CircleBorder(),
          )
        ],
      ),
    );
  }
}
