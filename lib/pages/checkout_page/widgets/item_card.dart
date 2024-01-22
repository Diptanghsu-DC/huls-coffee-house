import 'package:flutter/material.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/checkout_page/widgets/total_item_cost.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
  });

  final ProductModel item;

  @override
  Widget build(context) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.white,
      elevation: 5,
      shadowColor: Color.fromRGBO(224, 219, 196, 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 32),
        trailing: TotalItemCost(
          item: item,
        ),
        title: Text(
          item.itemName,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SofiaPro',
              fontWeight: FontWeight.w900),
        ),
        subtitle: Text(
          "\$ ${item.price}",
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'SofiaPro',
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
