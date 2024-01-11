// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/profile/widgets/profile_appbar.dart';
import 'package:provider/provider.dart';
import 'package:huls_coffee_house/pages/profile/utils/colors.dart';
import 'package:huls_coffee_house/pages/profile/utils/styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String routeName = ''; //add the route for this page
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: const ProfileAppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 98,
            left: 44,
            child: Container(
              width: 47,
              height: 29,
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Text(
                "XYZ", //name from backend
                style: AppStyles.userName,
              ),
            ),
          ),

          Positioned(
            top: 134,
            left: 43,
            child: GestureDetector(
              onTap: () {
                // Edit action
              },
              child: Container(
                width: 33,
                height: 18,
                child: Text(
                  "Edit",
                  style: AppStyles.functionButtonText,
                ),
              ),
            ),
          ),

          Positioned(
            top: 134,
            left: 283,
            child: GestureDetector(
              onTap: () {
                // Delete action
              },
              child: Container(
                width: 54,
                height: 18,
                child: Text(
                  "Delete",
                  style: AppStyles.functionButtonText,
                ),
              ),
            ),
          ),

          Positioned(
            top: 189,
            left: 25,
            child: Container(
              width: 310,
              height: 17,
              child: Text(
                "+91-92********", // Placeholder text
                style: AppStyles.userDetailText,
              ),
            ),
          ),
          Positioned(
            top: 189,
            left: 220,
            child: Container(
              width: 310,
              height: 17,
              child: Text(
                "xyz@gmail.com", // Placeholder text
                style: AppStyles.userDetailText,
              ),
            ),
          ),
          Positioned(
            top: 219,
            left: 12,
            child: Container(
              width: 337,
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
          ),

          Positioned(
            top: 278,
            left: 44,
            child: Text(
              "My Account",
              style: AppStyles.pageText,
            ),
          ),

          Positioned(
            top: 281,
            left: 283,
            child: GestureDetector(
              onTap: () {
                // Logout action
              },
              child: Container(
                width: 65,
                height: 18,
                child: Text(
                  "LOG OUT",
                  style: AppStyles.functionButtonText,
                ),
              ),
            ),
          ),

          Positioned(
            top: 337,
            left: 43,
            child: Container(
              width: 186,
              height: 16,
              child: Text(
                "asdfadfafafasdfadf", // Placeholder text
                style: AppStyles.userDetailText,
              ),
            ),
          ),

          Positioned(
            top: 390,
            left: 43,
            child: Text(
              "Addresses",
              style: AppStyles.pageText,
            ),
          ),

          Positioned(
            top: 446,
            left: 42,
            child: Container(
              width: 186,
              height: 16,
              child: Text(
                "huls cafe", // Placeholder text
                style: AppStyles.userDetailText,
              ),
            ),
          ),

          Positioned(
            top: 511,
            left: 44,
            child: Text(
              "Previous Order",
              style: AppStyles.pageText,
            ),
          ),

          // Divider below "Previous Order"
          Positioned(
            top: 547,
            left: 0,
            right: 0,
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
              height: 0,
            ),
          ),

          // List of items
        ],
      ),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     home: ProfilePage(),
//   ));
// }
