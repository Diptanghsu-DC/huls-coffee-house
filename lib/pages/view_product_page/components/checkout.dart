import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/checkout_page/checkout_page.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Container(
        alignment: Alignment.center,
        width: width * 0.930,
        height: height * 0.063,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)),
        child: CustomButton(
          text: "CHECKOUT NOW",
          onPressed: () => Navigator.pushNamed(
            context,
            CheckoutPage.routeName,
            arguments: {
              'checkoutItems': [product]
            },
          ),
        ));
  }
}
