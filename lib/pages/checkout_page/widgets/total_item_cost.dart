import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/models/models.dart';

class TotalItemCost extends StatefulWidget {
  TotalItemCost({
    super.key,
    required this.itemPrice, required this.item,
  });

  final num itemPrice;
  final ProductModel item;


  @override
  State<TotalItemCost> createState() => _TotalItemCostState();
}

class _TotalItemCostState extends State<TotalItemCost> {

  @override
  Widget build(BuildContext context) {
    num count = widget.item.quantity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
              color: orange, borderRadius: BorderRadius.circular(17)),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (count > 0) {
                        count--;
                      }
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SofiaPro'),
                  ),
                ),
                Text(
                  "${count}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SofiaPro'),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SofiaPro'),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          "\$${widget.itemPrice * count}",
          style: const TextStyle(
              fontFamily: 'SofiaPro',
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
