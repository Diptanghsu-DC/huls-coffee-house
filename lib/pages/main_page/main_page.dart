import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/cart_ui/cart_main.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';
import 'package:huls_coffee_house/pages/notifications_page/notifications_page.dart';
import 'package:huls_coffee_house/pages/profile/profile_main.dart';

import '../../config/config.dart';
import '../../utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/MainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const ProfilePage(),
    const Homepage(),
    const CartPage(),
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
          selectedItemColor: orange,
          type: BottomNavigationBarType.fixed,
          onTap: navigate,
          currentIndex: currentIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.profile_circled,
              ),
              label: "Account",
            ),
            const BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            const BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(
                CupertinoIcons.cart,
              ),
            ),
            BottomNavigationBarItem(
              label: "Notifications",
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
            ),
          ],
        ),
        body: pages[currentIndex],
      ),
    );
  }
}
