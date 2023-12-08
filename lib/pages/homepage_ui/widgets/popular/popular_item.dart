import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({
    super.key,
    required this.imgSrc,
    required this.price,
    required this.ratings,
    required this.itemName,
    required this.itemDesc,
  });
  final String? imgSrc;
  final num? ratings;
  final String itemName;
  final String? itemDesc;
  final num price;

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool isLiked = false;
  late num ratings = widget.ratings ?? 4.5; //default rating is 4.5
  late num price = widget.price; //price in Rs
  late String itemName = widget.itemName;
  late String? itemDesc = widget.itemDesc; //short description of item

  @override
  Widget build(BuildContext context) {
    String imgURL = widget.imgSrc ?? defaultImage; //set image url accordingly

    getSize(context);
    return Container(
      height: height * 0.3,
      child: Card(
        child: Stack(
          children: [
            //card image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imgURL,
                height: height * 0.17,
              ),
            ),
            //price tag
            Positioned(
              top: 8,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Rs",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          color: orange,
                        ),
                      ),
                      Text(
                        "$price",
                        style: TextStyle(fontSize: width * 0.045),
                      ),
                    ].separate(2),
                  ),
                ),
              ),
            ),
            //like button
            Positioned(
              top: isLiked ? 2 : null,
              right: isLiked ? 12 : 10,
              child: IconButton(
                color: isLiked ? Colors.red : Colors.grey,
                iconSize: isLiked ? width * 0.07 : width * 0.1,
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked; //more logic to be added
                  });
                },
                icon: Icon(
                  isLiked
                      ? CupertinoIcons.heart_solid
                      : CupertinoIcons.heart_circle_fill,
                ),
              ),
            ),
            //ratings
            Positioned(
              top: 108,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "$ratings",
                        style: TextStyle(fontSize: width * 0.045),
                      ),
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 233, 212, 29),
                      ),
                    ].separate(5),
                  ),
                ),
              ),
            ),
            //item name and description (if available)
            Positioned(
              top: 150,
              left: 15,
              child: Container(
                width: width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.05,
                      ),
                    ),
                    Text(
                      itemDesc ?? "",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
