import 'package:flutter/material.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_new_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/edit_item_box.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/product_stream.dart';
import 'package:huls_coffee_house/widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

import 'widgets/search_bar.dart';

class Inventory extends StatefulWidget {
  Inventory({super.key});

  static const String routeName = "/inventory";

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  int _currentIndex = 0;

  void bottomNavigator(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Item> items = [];

  List<Item> filteredItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(
          currentIndex: _currentIndex, onTap: bottomNavigator),
      appBar: AppBar(
        leading: SizedBox(
          width: 8.0,
          height: 8.0,
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: const Icon(
              Icons.arrow_back,
              size: 20.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          MySearchBar(
            onSearch: (query) {
              updateFilteredItems(query);
            },
          ),
          const SizedBox(height: 16),
          // for (Item item
          //     in filteredItems.isNotEmpty ? filteredItems : items) ...[
          //   ElevatedItemBox(item: item),
          //   const SizedBox(height: 16),
          // ],
          ProductStream(),
          ElevatedAddAnotherItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewItem(),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  void updateFilteredItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item.itemNameController.text
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              item.descriptionController.text
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }
}
