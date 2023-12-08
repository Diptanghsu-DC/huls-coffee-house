import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

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
    return BottomNavigationBar(
      selectedItemColor: orange,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onTap(index); // more logic to be added regarding page navigation
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
    );
  }
}
