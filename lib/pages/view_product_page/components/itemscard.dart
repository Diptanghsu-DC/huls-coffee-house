import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class ItemsCard extends StatelessWidget {
  String itemName;
  num itemPrice;
  String? itemDesc;
  num? itemRating;
  String itemImage;
  num quantity;

  ItemsCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    this.itemDesc,
    this.itemRating,
    required this.itemImage,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    final num modifiedRating = itemRating ?? 4.5;

    String imageUrl = itemImage.isEmpty ? defaultImage : itemImage;

    return Stack(
      children: [
        Container(
          width: width * 0.897,
          //height: height * 0.509,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.21),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3FD3D1D8),
                blurRadius: 36.43,
                offset: Offset(18.21, 18.21),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: width * 0.897,
                    height: height * 0.206,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.21),
                      color: Colors.amber,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.21),
                      child: imageUrl == defaultImage
                          ? Image.asset(
                              imageUrl,
                              fit: BoxFit.fill,
                            )
                          : CustomNetworkImage(
                              url: imageUrl,
                              height: height * 0.4,
                              errorWidget: (BuildContext context, _, __) {
                                return Image.asset(
                                  mediaImage,
                                  fit: BoxFit.cover,
                                  height: height * 0.4,
                                );
                              },
                            ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.0175,
                    left: width * 0.037,
                    child: Container(
                      width: width * 0.226,
                      height: height * 0.0425,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '₹',
                            style: TextStyle(
                                color: Color(0xFFFE724C), fontSize: 20),
                          ),
                          Text(
                            itemPrice.toString(), //itemprice
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      itemName, //itemname
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: (itemName.length > 15) ? 14 : 18,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "left in stock: ",
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontFamily: 'SofiaPro'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          // width: width * 0.0944,
                          // height: height * 0.0425,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFE724C),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "$quantity",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: itemDesc != null
                    ? Text(
                        itemDesc!, //itemsubname
                        style: const TextStyle(
                          color: Color(0xFF5B5B5E),
                          fontSize: 14.57,
                          fontFamily: 'Sofia Pro',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    : Text(""),
              ),
            ].separate(30),
          ),
        ),
        Positioned(
          top: height * 0.1875,
          left: width * 0.037,
          child: Container(
            width: width * 0.199,
            height: height * 0.0364,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(136),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x33FE724C),
                    blurRadius: 24.29,
                    offset: Offset(0, 6.07),
                    spreadRadius: 0,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  modifiedRating.toString(), //itemsrating
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
                const Text(
                  '⭐',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: height * 0.21,
        //   right: width * 0.03,
        //   child: Container(
        //     alignment: Alignment.center,
        //     // width: width * 0.0944,
        //     // height: height * 0.0425,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(200),
        //       color: const Color(0xFFFE724C),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         "$quantity",
        //         style: const TextStyle(
        //           color: Colors.white,
        //           fontSize: 20,
        //           fontFamily: 'Poppins',
        //           fontWeight: FontWeight.w500,
        //           height: 0,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: height * 0.239,
        //   left: width * 0.037,
        //   child: SizedBox(
        //     width: width * 0.7,
        //     child: Text(
        //       itemName, //itemname
        //       maxLines: 2,
        //       style: const TextStyle(
        //         color: Colors.black,
        //         fontSize: 18.21,
        //         fontFamily: 'Sofia Pro',
        //         fontWeight: FontWeight.w400,
        //         height: 0,
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: height * 0.294,
        //   left: width * 0.037,
        //   child: itemDesc != null
        //       ? Text(
        //           itemDesc!, //itemsubname
        //           style: const TextStyle(
        //             color: Color(0xFF5B5B5E),
        //             fontSize: 14.57,
        //             fontFamily: 'Sofia Pro',
        //             fontWeight: FontWeight.w400,
        //             height: 0,
        //           ),
        //         )
        //       : Text(""),
        // ),
        Visibility(
          visible: quantity == 0,
          child: Container(
            width: width * 0.897,
            height: height * 0.309,
            decoration: ShapeDecoration(
              color: Colors.grey.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.21),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3FD3D1D8),
                  blurRadius: 36.43,
                  offset: Offset(18.21, 18.21),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
