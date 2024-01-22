import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';

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
    const Inventory(),
    const OrderPage(),
    const ProfilePage(),
    const NotificationsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
    );
  }
}
