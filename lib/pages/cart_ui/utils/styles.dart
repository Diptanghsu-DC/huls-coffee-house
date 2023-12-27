import './colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headingStyle = TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: 'SofiaPro');

  static const TextStyle itemNameStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'SofiaPro');

  static const TextStyle priceStyle =
      TextStyle(color: Colors.orange, fontSize: 18, fontFamily: 'SofiaPro');
  static const TextStyle total = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 20,
      fontFamily: 'SofiaPro');
  static const TextStyle totalcost = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 20,
      fontFamily: 'SofiaPro');

  // static ButtonStyle checkoutbox = ElevatedButton.styleFrom(
  //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  //   backgroundColor: AppColors.orangeColor, // Adjust padding
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(50),
  //   ),
  // );
  static const TextStyle checkouttext = TextStyle(
      color: AppColors.whiteColor, fontSize: 20, fontFamily: 'SofiaPro');
// Add more styles as needed
}
