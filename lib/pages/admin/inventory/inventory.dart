import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_new_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/product_stream.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

import 'widgets/search_bar.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

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
        leading: GoBackButton(),
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
          const ProductStream(),
          ElevatedAddAnotherItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewItem(),
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
