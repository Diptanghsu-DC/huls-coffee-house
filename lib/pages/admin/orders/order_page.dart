import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/order_stream.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/utils.dart';

import '../../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const String routeName = '/OrderPage';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Scaffold(
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
