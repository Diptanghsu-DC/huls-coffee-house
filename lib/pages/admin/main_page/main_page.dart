import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        final NavigatorState navigator = Navigator.of(context);
        final bool shouldPop = await showExitWarning(context);
        if (shouldPop) {
          navigator.pop();
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: orange,
          type: BottomNavigationBarType.fixed,
          onTap: navigate,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.profile_circled,
              ),
              label: "Account",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.inventory,
              ),
              label: "Inventory",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.timer,
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.bell,
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
