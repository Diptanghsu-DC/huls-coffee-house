import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/order_history.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/order_log_class.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.userName,
    required this.userPhone,
    required this.userAddress,
  });

  final OrderModel order;
  final String itemName;
  final num quantity;
  final num price;
  final String userName;
  final num userPhone;
  final String userAddress;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Quantity",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Order By",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Phone No.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                    ].separate(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        child: Text(
                          ": ${widget.itemName}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.045,
                            fontFamily: "SofiaPro",
                          ),
                        ),
                      ),
                      Text(
                        ": ${widget.quantity}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": ${widget.userName}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": ${widget.userPhone}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": ${widget.userAddress}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                    ].separate(10),
                  )
                ],
              ),
              CustomButton(
                text: "Done",
                onPressed: () {
                  showLoadingOverlay(
                    context: context,
                    asyncTask: () async {
                      await OrderController.delete(widget.order);
                      await NotificationController.pushNotification(
                        NotificationModel(
                          title: "Order Completed !!",
                          message:
                              "Your order for ${widget.order.product} is completed",
                          sender: UserController.currentUser!.email,
                          receiver: widget.order.userEmail,
                          product: widget.order.product,
                          time: DateTime.now(),
                        ),
                      );
                      UserModel? oldUser = await UserController.get(
                              email: widget.order.userEmail)
                          .first
                          .then((value) => value.first);
                      UserModel? newUser =
                          oldUser!.copyWith(newNotification: true);
                      await UserController.update(
                          oldUser: oldUser, newUser: newUser);
                      await NotificationController.deleteNotification(
                        NotificationModel(
                          title: "",
                          message: "",
                          sender: widget.order.userEmail,
                          receiver: UserController.currentUser!.email,
                          product: widget.order.product,
                          time: DateTime.now(),
                        ),
                      );
                      final orderLog = OrderLog(
                          date: Formatter.dateOnly(DateTime.now()),
                          time: Formatter.timeOnly(DateTime.now()),
                          orderName: widget.itemName,
                          orderQuantity: widget.order.quantity,
                          totalPrice: widget.order.price,
                          orderCompletedBy:
                              UserController.currentUser!.address);
                      await LogOrder.log(orderLog.toJson());
                    },
                    onCompleted: () {
                      toastMessage(
                          "Order done. Notifying ${widget.userName}. Updating the order list in the next 100 seconds or you may pull to refresh",
                          context);
                      setState(() {});
                    },
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     CustomButton(text: "Accept"),
              //     CustomButton(text: "Decline")
              //   ],
              // )
            ].separate(10),
          ),
        ),
      ),
    );
  }
}
