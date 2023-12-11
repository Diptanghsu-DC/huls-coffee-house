import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/cart_ui/widgets/cart_appbar.dart';
import 'package:huls_coffee_house/pages/cart_ui/widgets/cart_itemcard.dart';
import 'package:huls_coffee_house/pages/cart_ui/widgets/cart_totalcost.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  static const String routeName = '/cartPage';
  @override
  State<Cart> createState() => CartPage();
}

class CartPage extends State<Cart> {
  // Function to calculate total cost
  double calculateTotalCost() {
    // Calculate total cost based on items in the cart
    // Replace with actual logic using backend data
    return 100.0; // Placeholder value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 10, // Change this to the actual number of cards
            padding: const EdgeInsets.only(
                bottom: 150), // Add padding for the last card
            itemBuilder: (BuildContext context, int index) {
              return const CartItemCard(); // Create a separate function to build each card
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: CartTotalCost(totalFunc: calculateTotalCost),
            ),
          ),
        ],
      ),
    );
  }
}
