import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';
import '../../notifications_page/notifications_page.dart';
import '../../pages.dart';
import '../../profile/profile_main.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});
  static const String routeName = '/AdminMainPage';

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  List pages = [
    const ProfilePage(),
    const Inventory(),
    const OrderPage(),
    const NotificationsPage()
  ];

  int currentIndex = 1;

  void navigate(int index) {
    setState(() {
      currentIndex = index;
      if (index == 3) {
        UserModel? oldUser = UserController.currentUser;
        UserController.currentUser =
            UserController.currentUser!.copyWith(newNotification: false);
        UserController.update(oldUser: oldUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (currentIndex != 1) {
          navigate(1);
          return;
        }
        if (didPop) {
          return;
        }

        final bool shouldPop = await showExitWarning(context);
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: orange,
          type: BottomNavigationBarType.fixed,
          onTap: navigate,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.profile_circled,
              ),
              label: "Account",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.inventory,
              ),
              label: "Inventory",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.timer,
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(
                    CupertinoIcons.bell,
                  ),
                  Visibility(
                    visible: UserController.currentUser!.newNotification,
                    child: const Positioned(
                      child: CircleAvatar(
                        backgroundColor: orange,
                        radius: 3.5,
                      ),
                    ),
                  )
                ],
              ),
              label: "Notifications",
            ),
          ],
        ),
        body: pages[currentIndex],
      ),
    );
  }
}
