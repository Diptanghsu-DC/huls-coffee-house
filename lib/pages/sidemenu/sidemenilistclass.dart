import 'package:flutter/cupertino.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenuitems.dart';

List<SideMenuItem> sideMenuItems = [
  SideMenuItem(
    title: 'About Us',
    iconPath1: CupertinoIcons.info,
  ),
  SideMenuItem(
    title: 'Privacy Policy',
    iconPath1: CupertinoIcons.lock,
  ),

  SideMenuItem(
    title: 'Account',
    iconPath1: CupertinoIcons.profile_circled,
  ),

  SideMenuItem(
    title: 'Cart',
    iconPath1: CupertinoIcons.cart,
  ),
  SideMenuItem(
    title: 'Notifications',
    iconPath1: CupertinoIcons.bell,
  ),

  // Add more SideMenuItem objects for additional items
];

List<SideMenuItem> sideMenuItemsAdmin = [
  SideMenuItem(
    title: 'About Us',
    iconPath1: CupertinoIcons.info,
  ),
  SideMenuItem(
    title: 'Privacy Policy',
    iconPath1: CupertinoIcons.lock,
  ),
  SideMenuItem(
    title: 'Account',
    iconPath1: CupertinoIcons.profile_circled,
  ),
  SideMenuItem(
    title: 'Inventory',
    iconPath1: CupertinoIcons.profile_circled,
  ),
  SideMenuItem(
    title: 'Orders',
    iconPath1: CupertinoIcons.profile_circled,
  ),
  SideMenuItem(
    title: 'Notifications',
    iconPath1: CupertinoIcons.profile_circled,
  ),
];
