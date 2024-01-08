import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/styles.dart';
import 'package:huls_coffee_house/utils/utils.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
  });

  final ProductModel cartItem;

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // Image from backend
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(8), // Adjust the radius as needed
              child: Image.asset('assets/images/sample.jfif',
                  height: 100, width: 100),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.itemName, // Item name from backend
                  style: AppStyles.itemNameStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${cartItem.price}", // Price from backend
                  style: AppStyles.priceStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 2, 2, 2),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle, color: orange),
                        onPressed: () {
                          // Remove item functionality
                        },
                      ),
                      const Text(
                          '1'), // Quantity - to be replaced by value from backend
                      IconButton(
                        icon: const Icon(Icons.add_circle, color: orange),
                        onPressed: () {
                          // Add item functionality
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
