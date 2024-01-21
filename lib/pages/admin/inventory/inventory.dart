import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_new_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/product_stream.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenudrawer.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';
import 'package:huls_coffee_house/widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';

import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import 'widgets/item_box.dart';
import 'widgets/search_bar.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  static const String routeName = "/inventory";

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  int _currentIndex = 0;
  List<ProductModel> filteredProducts = [];
  final StreamController<List<ProductModel>> _filteredProductsController =
      StreamController<List<ProductModel>>();

  void filterProducts(String searchValue) async {
    Stream<List<ProductModel>> allProductStream =
        ProductController.getAll(forceGet: true);
    await for (List<ProductModel> allProductsList in allProductStream) {
      setState(() {
        filteredProducts = allProductsList.where((product) {
          return product.itemName
              .toLowerCase()
              .contains(searchValue.toLowerCase());
        }).toList();

        _filteredProductsController.add(filteredProducts);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _filteredProductsController.close();
    super.dispose();
  }

  void bottomNavigator(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavigator(0);
  }

  List<Item> filteredItems = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(
        onPressed: () {
          if (_scaffoldKey.currentState != null) {
            _scaffoldKey.currentState!.openDrawer();
          }
        },
        icon: const Icon(Icons.menu),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
        ),
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       if (_scaffoldKey.currentState != null) {
      //         _scaffoldKey.currentState!.openDrawer();
      //       }
      //     },
      //     icon: const Icon(Icons.menu),
      //     style: IconButton.styleFrom(
      //       backgroundColor: Colors.white,
      //     ),
      //   ),
      // ),
      key: _scaffoldKey,
      bottomNavigationBar: CustomBottomNavigation(
           onTap: bottomNavigator),
      drawer: buildCustomDrawer(context),
      body: CustomBackground(
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 120,
            ),
            MySearchBar(
              onSearch: (query) {
                filterProducts(query);
              },
            ),
            filteredProducts.isEmpty
                ? const ProductStream()
                : StreamBuilder<List<ProductModel>>(
                    stream: ProductController.getAll(forceGet: true),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                            'Error in inventory.dart: ${snapshot.error}');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        // return const Text('Loading...');
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        filteredProducts = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: filteredProducts.length,
                            itemBuilder: (context, index) => ItemBox(
                              item: Item(product: filteredProducts[index]),
                            ),
                          ),
                        );
                      }
                    },
                  ),
            ElevatedAddAnotherItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddNewItem(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            )
          ].separate(10),
        ),
      ),
    );
  }
}
