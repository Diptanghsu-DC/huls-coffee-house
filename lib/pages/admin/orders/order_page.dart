import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/order_stream.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/utils.dart';

import '../../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const String routeName = '/orderPage';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _currentIndex = 1;

  void bottomNavigator(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavigator(1);
  }

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(onTap: bottomNavigator),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      appBar: AppBar(
        leading: const GoBackButton(),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.23),
          child: const Text(
            "Orders",
            style:
                TextStyle(fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const OrderStream(),
    );
  }
}
