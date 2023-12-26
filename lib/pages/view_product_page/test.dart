import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/itemscard.dart';
import 'package:huls_coffee_house/pages/view_product_page/model/viewalldata.dart';

class Test extends StatelessWidget {
  static const String routeName = '/test';
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> Items = [
      ItemModel(
          itemName: 'Cake1',
          itemPrice: 451,
          itemRating: 4,
          itemSubname: 'Dark Chocolate',
          itemImage: 'j'),
      ItemModel(
          itemName: 'Cake2',
          itemPrice: 300,
          itemRating: 5,
          itemSubname: 'strawbeery',
          itemImage: 'n')
    ];
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ItemsCard(
                itemName: Items[index].itemName,
                itemPrice: Items[index].itemPrice,
                itemRating: Items[index].itemRating,
                category: Items[index].itemSubname,
                itemImage: Items[index].itemImage,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: Items.length)
            );
  }
}
