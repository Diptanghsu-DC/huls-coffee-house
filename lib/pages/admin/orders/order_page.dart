import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/order_stream.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  static const String routeName = '/OrderPage';

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late final orders;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orders = OrderController.getAll();
  }

  Future<void> refresh() async{
    orders = OrderController.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const GoBackButton(),
        title: StreamBuilder<List<OrderModel>>(
          stream: orders,
          // Assuming getAll returns Stream<List<Order>>
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text(
                'Orders Pending: Loading...',
                style: TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
              );
            } else {
              final orderList = snapshot.data ?? [];
              return Text(
                'Orders Pending: ${orderList.length}',
                style: const TextStyle(
                    fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
              );
            }
          },
        ),
      ),
      body: RefreshIndicator(
        color: orange,
        onRefresh: () async{
          OrderStreamState orderStreamState = OrderStreamState();
          orderStreamState.refresh();
        },
          child: OrderStream()),
    );
  }
}
