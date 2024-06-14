import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/order_history.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/order_log_class.dart';
import 'package:huls_coffee_house/pages/admin/orders/widgets/confirm_popup.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/custom_field.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    super.key,
    required this.order,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.userName,
    required this.userPhone,
    required this.userAddress,
    required this.refresh,
  });

  final OrderModel order;
  final String itemName;
  final num quantity;
  final num price;
  final String userName;
  final num userPhone;
  final String userAddress;
  final Function refresh;

  final TextEditingController timerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                        "Total Price",
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
                          ": $itemName",
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
                        ": $quantity",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": Rs ${order.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": $userName",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      Text(
                        ": $userPhone",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.045,
                          fontFamily: "SofiaPro",
                        ),
                      ),
                      SizedBox(
                        width: width * 0.5,
                        child: Text(
                          ": $userAddress",
                          maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.045,
                            fontFamily: "SofiaPro",
                          ),
                        ),
                      ),
                    ].separate(10),
                  )
                ],
              ),
              order.isDelaySet
                  ? Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "${order.delay} min delay is already set for this order",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Form(
                      key: _formKey,
                      child: CustomField(
                        controller: timerController,
                        hintText: "Add Delivery time in minutes",
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty || num.parse(value) < 10) {
                            return "Delivery time must be greater than 10 min";
                          }
                          return null;
                        },
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    color: order.isDelaySet ? Colors.grey : null,
                    text: "Notify Customer",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (await showConfirmWarning(context, 0)) {
                          await OrderController.setTimer(order,
                              int.parse(timerController.text.toString()));
                          OrderController.initCountDown(order,
                              int.parse(timerController.text.toString()));
                          NotificationController.pushNotification(
                              NotificationModel(
                            title: "Order Delayed !!",
                            message:
                                "Sorry. Your order has been delayed by ${timerController.text} mins",
                            sender: UserController.currentUser!.email,
                            receiver: order.userEmail,
                            time: DateTime.now(),
                          ));
                          UserModel? oldUser =
                              await UserController.get(email: order.userEmail)
                                  .first
                                  .then((value) => value.first);
                          UserModel? newUser =
                              oldUser!.copyWith(newNotification: true);
                          await UserController.update(
                              oldUser: oldUser, newUser: newUser);
                          refresh();
                        }
                      }
                    },
                  ),
                  CustomButton(
                    text: "Done",
                    onPressed: () async {
                      if (await showConfirmWarning(context, 1)) {
                        showLoadingOverlay(
                          context: context,
                          asyncTask: () async {
                            await OrderController.delete(order);
                            await NotificationController.pushNotification(
                              NotificationModel(
                                title: "Order Completed !!",
                                message:
                                    "Your order for ${order.product} is completed",
                                sender: UserController.currentUser!.email,
                                receiver: order.userEmail,
                                product: order.product,
                                time: DateTime.now(),
                              ),
                            );
                            UserModel? oldUser =
                                await UserController.get(email: order.userEmail)
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
                                sender: order.userEmail,
                                receiver: UserController.currentUser!.email,
                                product: order.product,
                                time: DateTime.now(),
                              ),
                            );
                            final orderLog = OrderLog(
                                date: Formatter.dateOnly(DateTime.now()),
                                time: Formatter.timeOnly(DateTime.now()),
                                orderName: itemName,
                                orderQuantity: order.quantity,
                                totalPrice: order.price,
                                orderCompletedBy:
                                    UserController.currentUser!.address);
                            await LogOrder.log(orderLog.toJson());
                          },
                          onCompleted: () {
                            toastMessage(
                                "Order done. Notifying $userName.", context);
                            refresh();
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              CustomButton(
                text: "Reject Order",
                color: Colors.red,
                onPressed: () async {
                  if (await showConfirmWarning(context, 2)) {
                    showLoadingOverlay(
                      context: context,
                      asyncTask: () async {
                        final product =
                            await ProductController.get(itemName: order.product)
                                .first
                                .then((value) => value[0]);
                        final productQuantity =
                            await ProductController.getQuantity(product);
                        ProductController.create(product.copyWith(
                            quantity: productQuantity + order.quantity));
                        await OrderController.delete(order);
                        await NotificationController.pushNotification(
                          NotificationModel(
                            title: "Order Rejected !!",
                            message:
                                "We are very sorry. Your order for ${order.product} could not be completed. Please visit Huls Coffee House for further queries",
                            sender: UserController.currentUser!.email,
                            receiver: order.userEmail,
                            product: order.product,
                            time: DateTime.now(),
                          ),
                        );
                        UserModel? oldUser =
                            await UserController.get(email: order.userEmail)
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
                            sender: order.userEmail,
                            receiver: UserController.currentUser!.email,
                            product: order.product,
                            time: DateTime.now(),
                          ),
                        );
                      },
                      onCompleted: () {
                        toastMessage(
                            "Order rejected. Notifying $userName.", context);
                        refresh();
                      },
                    );
                  }
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
