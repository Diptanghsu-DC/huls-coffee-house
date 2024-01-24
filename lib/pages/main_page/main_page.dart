import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if(currentIndex != 1){
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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.profile_circled,
              ),
              label: "Account",
            ),
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(
                CupertinoIcons.cart,
              ),
            ),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(
                CupertinoIcons.bell,
              ),
            ),
          ],
        ),
        body: pages[currentIndex],
      ),
    );
  }
}
