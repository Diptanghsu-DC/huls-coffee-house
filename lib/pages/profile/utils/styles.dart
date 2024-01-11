import './colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle userName = TextStyle(
      color: AppColors.blackColor,
      fontSize: 24,
      height: 1.2,
      fontWeight: FontWeight.w400,
      fontFamily: 'SofiaPro');
  static const TextStyle headingStyle = TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: 'SofiaPro');
  static const TextStyle functionButtonText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.orangeColor,
      height: 1.2,
      fontFamily: 'SofiaPro');

  static const TextStyle userDetailText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.greyColor,
      height: 1.2,
      fontFamily: 'SofiaPro');

  static const TextStyle pageText = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: AppColors.blackColor,
      height: 1.2,
      fontFamily: 'SofiaPro');
  static const TextStyle totalcost = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 20,
      fontFamily: 'SofiaPro');

  static const TextStyle listText = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );
}
