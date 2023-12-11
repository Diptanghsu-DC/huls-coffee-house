import './colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headingStyle = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle itemNameStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle priceStyle = TextStyle(
    color: Colors.orange,
    fontSize: 18,
  );
  static const TextStyle total = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );
  static const TextStyle totalcost = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );
  // static ButtonStyle checkoutbox = ElevatedButton.styleFrom(
  //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  //   backgroundColor: AppColors.orangeColor, // Adjust padding
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(50),
  //   ),
  // );
  static const TextStyle checkouttext = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 20,
  );
  // Add more styles as needed
}
