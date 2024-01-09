import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/order_stream.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  static const String routeName = '/orderPage';

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.23),
          child: Text("data"),
        ),
      ),
      body: OrderStream(),
    );
  }
}
