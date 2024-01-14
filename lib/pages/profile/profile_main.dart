import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/profile/utils/styles.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static const String routeName = ''; // add the route for this page
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomBackground(
                  bodyWidget: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              UserController.currentUser!.name, //name from backend
                              style: AppStyles.userName,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Edit action
                                },
                                child: const Text(
                                  "Edit",
                                  style: AppStyles.functionButtonText,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  UserController.delete();
                                },
                                child: const Text(
                                  "Delete",
                                  style: AppStyles.functionButtonText,
                                ),
                              ),
                            ],
                          ),
                         const Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "+91-92********", // Placeholder text
                               style: AppStyles.userDetailText,
                             ),
                             Text(
                               "xyz@gmail.com", // Placeholder text
                               style: AppStyles.userDetailText,
                             ),
                           ],
                         ),
                          Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "My Account",
                                style: AppStyles.pageText,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Logout action
                                },
                                child: const Text(
                                  "LOG OUT",
                                  style: AppStyles.functionButtonText,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "asdfadfafafasdfadf", // Placeholder text
                            style: AppStyles.userDetailText,
                          ),
                          const Text(
                            "Addresses",
                            style: AppStyles.pageText,
                          ),
                          const Text(
                            "huls cafe", // Placeholder text
                            style: AppStyles.userDetailText,
                          ),
                          const Text(
                            "Previous Order",
                            style: AppStyles.pageText,
                          ),
                          Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                            height: 16.0,
                          ),
                          // List of items
                        ].separate(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
