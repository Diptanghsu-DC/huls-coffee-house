import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/food/food_list.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/popular/popular_item.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

class PopularViewer extends StatelessWidget {
  const PopularViewer({
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
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      //to show the popular items in a scrollable manner (4 items in the list rest in view all page, hence the popular list should contain minimum of 4 items(negotiable))
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(
          width: 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {}, //navigate to respective item details
            child: PopularItem(
              //to access popular item, the popular item list needs to be built first in foodlist.dart
              //if want to test only, take arguments from parent widget and set it here
              imgSrc: imgSrc,
              price: price,
              ratings: ratings,
              itemName: itemName,
              itemDesc:itemDesc,
            ),
          );
        },
      ),
    );
  }
}
