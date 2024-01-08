import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/colors.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/styles.dart';
import 'package:huls_coffee_house/pages/checkout_page/checkout_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

class CartTotalCost extends StatelessWidget {
  const CartTotalCost({
    super.key,
    required this.totalFunc,
  });

  final Function totalFunc;

  @override
  Widget build(BuildContext context) {
    getSize(context);
    double totalCost = totalFunc();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Orange "Total" label
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Total',
                    style: AppStyles.total,
                  ),
                ),
                // "Rs" label with amount
                Text(
                  'Rs $totalCost', // Display total cost here
                  style: AppStyles.totalcost,
                ),
              ],
            ),
          ),
        ),
        // SizedBox(height: 1),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: height * 0.075,
              child: CustomButton(
                text: "CHECKOUT",
                onPressed: () => Navigator.pushNamed(
                  context,
                  CheckoutPage.routeName,
                  arguments: {'checkoutItems': UserController.cartList},
                ),
              ),
            )),
      ],
    );
  }
}
