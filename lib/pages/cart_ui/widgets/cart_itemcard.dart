import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/styles.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.changeState,
  });

  final ProductModel cartItem;
  final Function changeState;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                // Image from backend
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8), // Adjust the radius as needed
                  child: Image.network(widget.cartItem.imageURL,
                      height: 100, width: 100),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItem.itemName, // Item name from backend
                      style: AppStyles.itemNameStyle,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs. ${widget.cartItem.price * widget.cartItem.quantity}", // Price from backend
                          style: AppStyles.priceStyle,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text('quantity: ${widget.cartItem.quantity}'),
                        // Quantity - to be replaced by value from backend
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            // left: 10.0,
            right: 0,
            top: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                  onPressed: () {
                    UserController.cartList.remove(widget.cartItem);
                    widget.changeState();
                    // Navigator.maybePop(context);
                  },
                  icon: const Icon(Icons.cancel)),
            ),
          ),
        ],
      ),
    );
  }
}
