import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_item.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/add_new_item.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenudrawer.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

import '../../../controllers/controllers.dart';
import '../../../models/models.dart';
import 'widgets/item_box.dart';
import 'widgets/search_bar.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  static const String routeName = '/Inventory';

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<ProductModel> filteredProducts = [];
  Stream<List<ProductModel>>? allProductStream;
  TextEditingController searchController = TextEditingController();

  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async{
    allProductStream = ProductController.getAll();
  }

  @override
  void dispose() {
    // Dispose of the search controller
    searchController.dispose();
    super.dispose();
  }

  Future<void> filterProducts(String searchValue) async {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      try {
        List<ProductModel> allProductsList =
            await ProductController.getAll().first;
        setState(() {
          filteredProducts = allProductsList
              .where((product) => product.itemName
                  .toLowerCase()
                  .contains(searchValue.toLowerCase()))
              .toList();

          // If no items match the search query, set filteredProducts to an empty list
          if (filteredProducts.isEmpty) {
            filteredProducts = [];
          }
        });
      } catch (error) {
        setState(() {
          // Handle error
          if (kDebugMode) {
            print('Error filtering products: $error');
          }
        });
      }
    });
  }

  Future<void> refresh() async {
    init();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Scaffold(
        drawer: buildCustomDrawer(context),
        body: CustomBackground(
          bodyWidget: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  MySearchBar(
                    controller: searchController,
                    onSearch: filterProducts,
                  ),
                  Flexible(
                    child: StreamBuilder<List<ProductModel>>(
                      stream: allProductStream,
                      builder: (context, snapshot) {
                        List<ProductModel> products = snapshot.data ?? [];
                        if (filteredProducts.isNotEmpty) {
                          products = filteredProducts;
                        }
                        if (snapshot.hasError) {
                          return Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(color: Colors.red),
                          );
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: orange,
                            ),
                          );
                        } else if (products.isEmpty) {
                          return const Center(
                            child: Text(
                              'Products not found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) =>
                              ItemBox(item: Item(product: products[index])),
                        );
                      },
                    ),
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
              Positioned(
                left: 15,
                top: 35,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
