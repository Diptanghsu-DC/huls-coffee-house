import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.userName,
    required this.userPhone,
  });

  final String itemName;
  final int quantity;
  final int price;
  final String userName;
  final num userPhone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Quantity",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Order By",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Phone No.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                    ].separate(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.5,
                        child: Text(
                          ": $itemName",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                            fontFamily: "SofiaPro",
                          ),
                        ),
                      ),
                      Text(
                        ": $quantity",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": $userName",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": $userPhone",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                    ].separate(10),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: orange, foregroundColor: Colors.white),
                    child: const Text(
                      "Accept",
                      style: TextStyle(
                        fontFamily: "SofiaPro",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: orange, foregroundColor: Colors.white),
                    child: const Text(
                      "Decline",
                      style: TextStyle(
                        fontFamily: "SofiaPro",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ].separate(10),
          ),
        ),
      ),
    );
  }
}
