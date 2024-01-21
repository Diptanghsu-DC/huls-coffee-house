import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/profile/profile_main.dart';

// enum Tab {Account, Liked, Home, Cart, Notifications}

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.currentRouteName,
    required this.onTap,
  });

  final String currentRouteName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final bool isSeller = UserController.currentUser?.isSeller ?? false;
    final List<String> accountRoutes = ['ProfilePage'];
    final List<String> homeRoutes = ['Homepage'];
    final List<String> cartRoutes = ['CartPage'];
    final List<String> notificationRoutes = ['NotificationsPage']; // Replace with the actual notification page route
    final List<String> inventoryRoutes = ['Inventory'];
    final List<String> ordersRoutes = ['OrderPage'];

    Color getItemColor(String routeName) {
      return routeName == currentRouteName ? orange : Colors.grey;
    }

    return BottomNavigationBar(
      currentIndex: -1, // Setting an invalid index to prevent any item from being selected initially
      selectedItemColor: orange,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onTap(index);
        if (isSeller) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, Inventory.routeName);
              break;
            case 1:
              Navigator.pushNamed(context, OrderPage.routeName);
              break;
          // Add more cases if needed for additional items
          }
        } else {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, ProfilePage.routeName);
              break;
            case 1:
              Navigator.pushNamed(context, Homepage.routeName);
              break;
            case 2:
              Navigator.pushNamed(context, CartPage.routeName);
              break;
            case 3:
            // Navigate to the notifications page
              break;
          // Add more cases if needed for additional items
          }
        }
      },
      items: isSeller
          ? [
        BottomNavigationBarItem(
          icon: const Icon(Icons.inventory),
          label: "Inventory",
          backgroundColor: getItemColor(inventoryRoutes.first),
        ),
        BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.timer),
          label: "Orders",
          backgroundColor: getItemColor(ordersRoutes.first),
        ),
      ]
          : [
        BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          label: "Account",
          backgroundColor: getItemColor(accountRoutes.first),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: "Home",
          backgroundColor: getItemColor(homeRoutes.first),
        ),
        BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.cart),
          label: "Cart",
          backgroundColor: getItemColor(cartRoutes.first),
        ),
        BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.bell),
          label: "Notifications",
          backgroundColor: getItemColor(notificationRoutes.first),
        ),
      ],
    );
  }
}
