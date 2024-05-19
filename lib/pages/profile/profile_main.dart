import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:huls_coffee_house/utils/database/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/models/user/user_model.dart';
import 'package:huls_coffee_house/pages/login_ui/login_page.dart';
import 'package:huls_coffee_house/pages/profile/user_update_page.dart';
import 'package:huls_coffee_house/pages/profile/utils/styles.dart';
import 'package:huls_coffee_house/pages/profile/widgets/current_orders.dart';
import 'package:huls_coffee_house/utils/logout_message.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

import '../login_ui/widgets/buttons.dart';
import 'widgets/confirm_delete.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String routeName = '/ProfilePage';

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        UserController.currentUser!.name,
                        //name from backend
                        style: AppStyles.userName,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () async {
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
                          TextButton(
                            onPressed: () {
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
                          TextButton(
                            onPressed: () async {
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
                      const Text(
                        "Address",
                        style: AppStyles.pageText,
                      ),
                      Text(
                        UserController.currentUser!.address, // Placeholder text
                        style: AppStyles.userDetailText,
                      ),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        height: 16.0,
                      ),
                      // const Text(
                      //   "Seller",
                      //   style: AppStyles.pageText,
                      // ),
                      // const Text(
                      //   "Huls Coffee House", // Placeholder text
                      //   style: AppStyles.userDetailText,
                      // ),
                      // const Text(
                      //   "Huls Coffee House", // Placeholder text
                      //   style: AppStyles.userDetailText,
                      // ),
                      // Divider(
                      //   color: Colors.grey[400],
                      //   thickness: 1,
                      //   height: 16.0,
                      // ),
                      !UserController.currentUser!.isSeller
                          ? TextButton.icon(
                              onPressed: () async {
                                final admins = await UserController.getAdmins();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CurrentOrders(admin: admins.first),
                                  ),
                                );
                              },
                              label: const Text(
                                "Current Orders",
                                style: AppStyles.pageText,
                              ),
                              icon: const Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                            )
                          : TextButton.icon(
                              onPressed: () async {
                                final Uri _url = Uri.parse(dotenv
                                    .env[EnvValues.SPREADSHEET_URL.name]!);
                                if (!await launchUrl(_url)) {
                                  toastMessage(
                                      "Cannot open Order History. Please contact developers",
                                      context);
                                }
                              },
                              label: const Text(
                                "Previous Orders",
                                style: AppStyles.pageText,
                              ),
                              icon: const Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                              ),
                            ),

                      // List of items
                    ].separate(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // ],
      // ),
      // ),
      // ),
    );
  }
}
