import 'package:flutter/material.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/order_stream.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/utils.dart';


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
        centerTitle: true,
        leading: const GoBackButton(),
        title: Text(
          "Orders Pending: ${OrderController.orderQueue.length}",
          style:
              const TextStyle(fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
        ),
      ),
      body: OrderStream(),
      // ),
    );
  }
}
