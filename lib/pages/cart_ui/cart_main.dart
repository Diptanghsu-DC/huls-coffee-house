import 'package:flutter/material.dart';
import './styles.dart';
import './colors.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
static const String routeName = '/cartPage';
  @override
  State<Cart> createState() => CartPage();
}
class CartPage extends State<Cart> {
  // const CartPage({super.key});

  // Function to build the AppBar
  AppBar buildAppBar() {
    return AppBar(
      elevation: 4,
      backgroundColor: AppColors.whiteColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
        onPressed: () {
          // Implement navigation to previous page here
        },
      ),
      title: const Text(
        'Cart',
        style: AppStyles.headingStyle,
      ),
      centerTitle: true,
    );
  }

  // Function to build individual card items
  Widget buildCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                const Text(
                  'Item Name', // Item name from backend
                  style: AppStyles.itemNameStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Rs 50', // Price from backend
                  style: AppStyles.priceStyle,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 2, 2, 2),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle,
                            color: AppColors.orangeColor),
                        onPressed: () {
                          // Remove item functionality
                        },
                      ),
                      const Text(
                          '1'), // Quantity - to be replaced by value from backend
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: AppColors.orangeColor),
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

  // Function to calculate total cost
  double calculateTotalCost() {
    // Calculate total cost based on items in the cart
    // Replace with actual logic using backend data
    return 100.0; // Placeholder value
  }

  Widget buildTotalCost() {
    double totalCost = calculateTotalCost(); // Get total cost

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
                    color: AppColors.orangeColor,
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
          child: FloatingActionButton.extended(
            onPressed: () {
              // Action on pressing the checkout button
            },
            backgroundColor: AppColors.orangeColor,
            label: const Text(
              'CHECKOUT',
              style: AppStyles.checkouttext,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 10, // Change this to the actual number of cards
            padding: const EdgeInsets.only(
                bottom: 150), // Add padding for the last card
            itemBuilder: (BuildContext context, int index) {
              return buildCard(); // Create a separate function to build each card
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: buildTotalCost(),
            ),
          ),
        ],
      ),
    );
  }
}
