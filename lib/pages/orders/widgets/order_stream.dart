import 'package:flutter/material.dart';
import 'package:huls_coffee_house/models/order/order_model.dart';
import 'package:huls_coffee_house/pages/orders/widgets/order_card.dart';

class OrderStream extends StatelessWidget {
  const OrderStream({
    super.key,
    // required this.orderList,
  });

  // final List<OrderModel> orderList;

  @override
  Widget build(context) {
    List<OrderModel> orderList = [
      OrderModel(
        product: "abcdefgh",
        quantity: 10,
        user: "kjbyuhfbvjgnf",
        userPhone: 1111111111,
        time: DateTime.now(),
      ),
      OrderModel(
          product:
              "productttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt",
          quantity: 2,
          user: "user",
          userPhone: 6585748574875,
          time: DateTime.now())
    ];
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (context, index) => OrderCard(
        itemName: orderList[index].product,
        quantity: orderList[index].quantity,
        price: orderList[index].quantity,
        userName: orderList[index].user,
        userPhone: orderList[index].userPhone,
      ),
    );
  }
}
