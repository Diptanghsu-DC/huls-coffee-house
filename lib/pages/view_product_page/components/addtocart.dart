import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/cart.dart';
import 'package:huls_coffee_house/utils/toast_message.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return InkWell(
      onTap: () {
        final cart = Provider.of<Cart>(context, listen: false);
        cart.addToCart(product);
        toastMessage("Item added to cart");
      },
      child: SizedBox(
        width: width * 0.4638,
        height: height * 0.06625,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: width * 0.4638,
                height: height * 0.06625,
                decoration: ShapeDecoration(
                  color: orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.50),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x33FE724C),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 6,
              top: 6,
              child: Container(
                width: width * 0.111,
                height: height * 0.05,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.shopping_bag,
                    color: orange,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.06625/3,
              right: 6,
              child: const Text(
                'ADD TO CART ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Sofia Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
