import 'package:flutter/material.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/cart.dart';
import 'package:huls_coffee_house/pages/cart_ui/widgets/cart_appbar.dart';
import 'package:huls_coffee_house/pages/cart_ui/widgets/cart_itemcard.dart';
import 'package:huls_coffee_house/pages/cart_ui/widgets/cart_totalcost.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static const String routeName = '/cartPage';
  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  // Function to calculate total cost
  double calculateTotalCost() {
    // Calculate total cost based on items in the cart
    // Replace with actual logic using backend data
    return 100.0; // Placeholder value
  }
  int _currentIndex = 2;

  void bottomNavigator(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: _currentIndex,
          onTap: bottomNavigator,
        ),
        appBar: const CartAppBar(),
        body: Consumer<Cart>(
          builder: (context, cart, child) {
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: UserController.cartList
                      .length, // Change this to the actual number of cards
                  padding: const EdgeInsets.only(
                      bottom: 150), // Add padding for the last card
                  itemBuilder: (BuildContext context, int index) {
                    return CartItemCard(
                      cartItem: UserController.cartList[index],
                    ); // Create a separate function to build each card
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    child: CartTotalCost(totalFunc: calculateTotalCost),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
