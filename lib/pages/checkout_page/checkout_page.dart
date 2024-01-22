import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/order/order_controller.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/checkout_page/widgets/item_card.dart';
import 'package:huls_coffee_house/pages/checkout_page/widgets/total_item_cost.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/utils/toast_message.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.checkoutItems,
  });

  final List<ProductModel> checkoutItems;

  static const String routeName = '/checkoutPage';

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        centerTitle: true,
        title: const Text(
          "Checkout Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'SofiaPro'),
        ),
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28), color: orange),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 8.0),
                    child: Icon(
                      Icons.timer_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Delivery in 10 min",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: 'SofiaPro',
                        fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const Text(
              "ITEM(s) ADDED",
              style: TextStyle(
                  fontFamily: 'SofiaPro',
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.checkoutItems.length,
                itemBuilder: (context, index) =>
                    ItemCard(item: widget.checkoutItems[index]),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              color: Colors.white,
              elevation: 5,
              shadowColor: const Color.fromRGBO(224, 219, 196, 0.9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, ViewAll.routeName),
                title: const Text(
                  "Add More Items",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'SofiaPro'),
                ),
                leading: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: orange,
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.8,
              height: height * 0.075,
              child: CustomButton(
                onPressed: () {
                  for (var i = 0; i < widget.checkoutItems.length; i++) {
                    OrderModel myOrder = OrderModel(
                      product: widget.checkoutItems[i].itemName,
                      quantity: widget.checkoutItems[i].quantity,
                      user: UserController.currentUser!.name,
                      userPhone: UserController.currentUser!.phone,
                      time: DateTime.now(),
                    );
                    OrderController.create(myOrder);
                    UserController.orderList.add(myOrder);
                    toastMessage("Order Placed Successfully");
                    Navigator.pushNamedAndRemoveUntil(context,
                        OrderSuccessfulPage.routeName, (route) => false);
                  }
                },
                leadingIcon: Icons.list_alt_sharp,
                text: "PLACE ORDER",
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
