import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';

// enum Tab {Account, Liked, Home, Cart, Notifications}

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  int currentIndex;
  final Function onTap;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return !UserController.currentUser!.isSeller
        ? BottomNavigationBar(
            selectedItemColor: orange,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                widget.currentIndex = index;
              });
              // more logic to be added regarding page navigation
              // onTap(index);
              // if (index == 0) {
              //   Navigator.pushNamed(context, ProfilePage.routeName);
              // } else if (index == 1) {
              //   Navigator.pushNamed(context, Homepage.routeName);
              // } else if (index == 2) {
              //   Navigator.pushNamed(context, CartPage.routeName);
              // } else if (index == 3) {
              //   Navigator.pushNamed(context, NotificationsPage.routeName);
              // }
            },
            currentIndex: widget.currentIndex,
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
          )
        : BottomNavigationBar(
            currentIndex: widget.currentIndex,
            selectedItemColor: orange,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              // widget.onTap(index);
              // if (index == 0) {
              //   Navigator.pushNamed(context, Inventory.routeName);
              // } else if (index == 1) {
              //   Navigator.pushNamed(context, OrderPage.routeName);
              // }
              widget.currentIndex = index;

            },
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
          );
  }
}
