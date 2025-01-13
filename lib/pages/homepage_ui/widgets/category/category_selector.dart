import 'dart:io';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/view_product_page/viewall.dart';
// import 'package:huls_coffee_house/config/configurations/assets/asset.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    super.key,
    this.categoryImageURL,
    required this.category,
  });
  String? categoryImageURL;
  final String category;

  @override
  Widget build(BuildContext context) {
    getSize(context);
    String categoryImage = categoryImageURL ?? defaultImage;
    // return Container(
    //   //shadow
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(60),
    //     boxShadow: [
    //       BoxShadow(
    //         color: orange.withOpacity(0.3),
    //         spreadRadius: 0.05,
    //         blurRadius: 5.0,
    //       )
    //     ],
    //   ),
    //   child: Card(
    //     elevation: 0,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    //     child: Padding(
    //       padding: const EdgeInsets.all(6.0),
    //       child: Column(
    //         children: [
    //           //circular image of category
    //           CircleAvatar(
    //             radius: width * 0.09,
    //             backgroundImage: AssetImage(categoryImage),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(
    //               bottom: 18.0,
    //               left: 6.0,
    //             ),
    //             child: SizedBox(
    //               width: width * 0.2,
    // child: Text(
    //   category,
    //   maxLines: 1,
    //   overflow: TextOverflow.ellipsis,
    //   style: const TextStyle(
    //     color: orange,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 15,
    //   ),
    // ),
    //             ),
    //           ),
    //         ].separate(15),
    //       ),
    //     ),
    //   ),
    // );
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewAll(
              category: category,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: orange),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        category,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: orange,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
