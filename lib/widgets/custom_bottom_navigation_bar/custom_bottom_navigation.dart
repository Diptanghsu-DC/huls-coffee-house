import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';
import 'package:huls_coffee_house/pages/cart_ui/cart_main.dart';
import 'package:huls_coffee_house/pages/homepage_ui/homepage.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/profile/profile_main.dart';

// enum Tab {Account, Liked, Home, Cart, Notifications}

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return !UserController.currentUser!.isSeller
        ? BottomNavigationBar(
            selectedItemColor: orange,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              // more logic to be added regarding page navigation
              onTap(index);
              if (index == 0) {
                Navigator.pushNamed(context, ProfilePage.routeName);
              } else if (index == 1) {
              } else if (index == 2) {
                Navigator.pushNamed(context, Homepage.routeName);
              } else if (index == 3) {
                Navigator.pushNamed(context, CartPage.routeName);
              } else if (index == 4) {}
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.profile_circled,
                ),
                label: "Account",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.heart,
                ),
                label: "Liked",
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
          )
        : BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: orange,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              onTap(index);
              if (index == 0) {
                Navigator.pushNamed(context, Inventory.routeName);
              } else if (index == 1) {
                Navigator.pushNamed(context, OrderPage.routeName);
              }
            },
            items: const [
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
            ],
          );
  }
}
