import 'dart:io';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

class CategoryButton extends StatelessWidget {
  CategoryButton({
    super.key,
    required this.onTap,
    this.categoryImageURL,
    required this.category,
  });
  final Function onTap;
  String? categoryImageURL;
  final String category;

  @override
  Widget build(BuildContext context) {
    categoryImageURL = categoryImageURL ?? defaultImage;
    return ElevatedButton(
      onPressed: () {},
      // style: ElevatedButton.styleFrom(shape: const BeveledRectangleBorder()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              categoryImageURL!,
              height: height * 0.13,
            ),
            Text(category),
          ].separate(30),
        ),
      ),
    );
  }
}
