import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/login_page.dart';
import 'package:huls_coffee_house/pages/profile/user_update_page.dart';
import 'package:huls_coffee_house/pages/profile/utils/colors.dart';
import 'package:huls_coffee_house/pages/profile/utils/styles.dart';
import 'package:huls_coffee_house/utils/logout_message.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';
import 'package:huls_coffee_house/widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

import '../login_ui/widgets/buttons.dart';
import 'widgets/confirm_delete.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String routeName = '/ProfilePage';
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  int _currentIndex = 0;

  void bottomNavigator(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const GoBackButton(),
      body: Stack(
        children: [
          CustomBackground(
            bodyWidget: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      UserController.currentUser!.name,
                      //name from backend
                      style: AppStyles.userName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserUpdatePage(),
                              ),
                            );
                            setState(() {});
                          },
                          child: const Text(
                            "Edit",
                            style: AppStyles.functionButtonText,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const ConfirmDelProfile(),
                            );
                          },
                          child: const Text(
                            "Delete",
                            style: AppStyles.functionButtonText,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "My Account",
                          style: AppStyles.pageText,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await showLogoutWarning(context)) {
                              UserController.logOut();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  LoginPage.routeName, (route) => false);
                            }
                          },
                          child: const Text(
                            "LOG OUT",
                            style: AppStyles.functionButtonText,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Account details:", // Placeholder text
                      style: AppStyles.userDetailText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          UserController.currentUser!.phone.toString(),
                          // Placeholder text
                          style: AppStyles.userDetailText,
                        ),
                        Text(
                          UserController.currentUser!.email,
                          // Placeholder text
                          style: AppStyles.userDetailText,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                      height: 16.0,
                    ),
                    // const Text(
                    //   "Address",
                    //   style: AppStyles.pageText,
                    // ),
                    // Text(
                    //   UserController.currentUser!.address, // Placeholder text
                    //   style: AppStyles.userDetailText,
                    // ),
                    Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                      height: 16.0,
                    ),
                    !UserController.currentUser!.isSeller
                        ? const Text(
                            "Current Orders",
                            style: AppStyles.pageText,
                          )
                        : Container(),
                    !UserController.currentUser!.isSeller
                        ? StreamBuilder<List<OrderModel>>(
                            stream: OrderController.get(
                                user: UserController.currentUser!.name),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: orange,
                                ));
                              } else if (!snapshot.hasData) {
                                return const Text("No current orders");
                              }
                              List<OrderModel> orders = snapshot.data ?? [];
                              return Flexible(
                                child: ListView.builder(
                                  itemCount: orders.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          orders[index].product,
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: const Color.fromARGB(
                                                255, 57, 57, 60),
                                            fontFamily: "SofiaPro",
                                          ),
                                        ),
                                        Text(
                                          "${orders[index].quantity}",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: const Color.fromARGB(
                                                255, 57, 57, 60),
                                            fontFamily: "SofiaPro",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Container()
                    // List of items
                  ].separate(20),
                ),
              ),
            ),
          ),
        ],
      ),
      // ],
      // ),
      // ),
    );
  }
}
