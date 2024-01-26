import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/order/order_model.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/order_card.dart';

class OrderStream extends StatefulWidget {
  const OrderStream({
    super.key,
    // required this.orderList,
  });

  @override
  State<OrderStream> createState() => _OrderStreamState();
}

class _OrderStreamState extends State<OrderStream> {
  // final List<OrderModel> orderList;
  Future<void> refresh() async {
    setState(() {
      // init();
    });
  }

  @override
  Widget build(context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: StreamBuilder<List<OrderModel>>(
        stream: OrderController.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else {
            // Process the data from snapshot
            final orders = snapshot.data!;

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) => OrderCard(
                order: orders[index],
                itemName: orders[index].product,
                quantity: orders[index].quantity,
                price: orders[index].quantity,
                userName: orders[index].user,
                userPhone: orders[index].userPhone,
                userAddress: orders[index].address,
              ),
            );
          }
        },
      ),
    );

    // List<OrderModel> orderList = [
    //   OrderModel(
    //     product: "abcdefgh",
    //     quantity: 10,
    //     user: "kjbyuhfbvjgnf",
    //     userPhone: 1111111111,
    //     time: DateTime.now(),
    //   ),
    //   OrderModel(
    //       product:
    //           "productttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt",
    //       quantity: 2,
    //       user: "user",
    //       userPhone: 6585748574875,
    //       time: DateTime.now())
    // ];
    // return ListView.builder(
    //   itemCount: orderList.length,
    //   itemBuilder: (context, index) => OrderCard(
    //     itemName: orderList[index].product,
    //     quantity: orderList[index].quantity,
    //     price: orderList[index].quantity,
    //     userName: orderList[index].user,
    //     userPhone: orderList[index].userPhone,
    //   ),
    // );
  }
}
