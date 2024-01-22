import 'package:flutter/cupertino.dart';
import 'package:huls_coffee_house/pages/Sidemenu/sidemenuitems.dart';

List<SideMenuItem> sideMenuItems = [
  SideMenuItem(
    title: 'About Us',
    iconPath1: CupertinoIcons.info,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
  SideMenuItem(
    title: 'Privacy Policy',
    iconPath1: CupertinoIcons.lock,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),

  SideMenuItem(
    title: 'Account',
    iconPath1: CupertinoIcons.profile_circled,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),

  SideMenuItem(
    title: 'Cart',
    iconPath1: CupertinoIcons.cart,
    onTap: () {
      // Utils().toastMessage('Feature Under Development');

      // Define the action for Item 1 onTap
      // e.g., Navigator.push(...), setState(...), etc.
    },
  ),
  SideMenuItem(
    title: 'Notifications',
    iconPath1: CupertinoIcons.bell,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),

  // Add more SideMenuItem objects for additional items
];

List<SideMenuItem> sideMenuItemsAdmin = [
  SideMenuItem(
    title: 'About Us',
    iconPath1: CupertinoIcons.info,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
  SideMenuItem(
    title: 'Privacy Policy',
    iconPath1: CupertinoIcons.lock,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
  SideMenuItem(
    title: 'Account',
    iconPath1: CupertinoIcons.profile_circled,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
  SideMenuItem(
    title: 'Inventory',
    iconPath1: CupertinoIcons.profile_circled,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
  SideMenuItem(
    title: 'Orders',
    iconPath1: CupertinoIcons.profile_circled,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
  SideMenuItem(
    title: 'Notifications',
    iconPath1: CupertinoIcons.profile_circled,
    onTap: () {
      // Define the action for Item 2 onTap
    },
  ),
];
