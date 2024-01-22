import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/category/category_view.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenudrawer.dart';
import 'package:huls_coffee_house/widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';
import 'package:huls_coffee_house/pages/pages.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import '../view_product_page/components/itemscard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static const String routeName = '/HomePage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 1;

  final GlobalKey<ScaffoldState> _scaffold_Key = GlobalKey<ScaffoldState>();

  List<ProductModel> filteredProducts = [];
  Stream<List<ProductModel>>? allProductStream;

  final StreamController<List<ProductModel>> _filteredProductsController =
      StreamController<List<ProductModel>>();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    allProductStream = ProductController.getAll();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _filteredProductsController.close();
  }

  void bottomNavigator(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Timer? _debounceTimer;

  Future<void> filterProducts(String searchValue) async {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      List<ProductModel> allProductsList =
      await ProductController.getAll().first;

      setState(() {
        filteredProducts = allProductsList
            .where((product) =>
            product.itemName.toLowerCase().contains(searchValue.toLowerCase()))
            .toList();

        _filteredProductsController.add(filteredProducts);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //getting the size of the screen
    getSize(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async{
        if (didPop) {
          return;
        }
        final NavigatorState navigator = Navigator.of(context);
        final bool shouldPop = await showExitWarning(context);
        if (shouldPop) {
          navigator.pop();
        }
      },
      child: Stack(
        children: [
          Scaffold(
              key: _scaffold_Key,
              drawer: buildCustomDrawer(context),
              body: CustomBackground(
                bodyWidget: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                    top: 95.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "What would you like to order",
                          style: TextStyle(
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.bold,
                              height: 1,
                              fontFamily: 'SofiaPro'),
                        ),
                        //search bar
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            labelText: 'Search for food',
                            hintText: 'Search Your Food Item Here',
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor:
                                const Color.fromARGB(255, 143, 142, 142),
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.037,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'SofiaPro'),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 101, 100, 100),
                                fontFamily: 'SofiaPro'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 192, 191, 191),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                color: orange,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            filterProducts(value);
                          },
                        ),
                        //category view
                        const CategoryViewer(),
                        (filteredProducts.isEmpty)
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Popular Items",
                                        style: TextStyle(
                                            fontSize: width * 0.07,
                                            fontWeight: FontWeight.bold,
                                            height: 1,
                                            fontFamily: 'SofiaPro'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, ViewAll.routeName),
                                        //to view all page
                                        style: TextButton.styleFrom(
                                          foregroundColor: orange,
                                        ),
                                        child: const Text(
                                          "View All >",
                                          style:
                                              TextStyle(fontFamily: 'SofiaPro'),
                                        ),
                                      )
                                    ],
                                  ),
                                  //view popular items
                                  StreamBuilder<List<ProductModel>>(
                                    stream: allProductStream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<ProductModel> allProducts =
                                            snapshot.data!;

                                        return SizedBox(
                                          height: height * 0.3,
                                          child: ListView.builder(
                                            itemCount: allProducts.length >= 4 ? 4 : allProducts.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewProduct(
                                                                product:
                                                                    allProducts[
                                                                        index]),
                                                      ));
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: ItemsCard(
                                                    itemImage:
                                                        allProducts[index]
                                                            .imageURL,
                                                    itemName: allProducts[index]
                                                        .itemName,
                                                    itemPrice:
                                                        allProducts[index]
                                                            .price,
                                                    itemRating:
                                                        allProducts[index]
                                                            .ratings,
                                                    category: allProducts[index]
                                                        .category,
                                                    quantity: allProducts[index]
                                                        .quantity,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      } else {
                                        return const CircularProgressIndicator(
                                          color: orange,
                                        ); // or a placeholder widget
                                      }
                                    },
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Search Results",
                                        style: TextStyle(
                                            fontSize: width * 0.07,
                                            fontWeight: FontWeight.bold,
                                            height: 1,
                                            fontFamily: 'SofiaPro'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pushNamed(
                                            context, ViewAll.routeName),
                                        //to view all page
                                        style: TextButton.styleFrom(
                                          foregroundColor: orange,
                                        ),
                                        child: const Text(
                                          "View All >",
                                          style:
                                              TextStyle(fontFamily: 'SofiaPro'),
                                        ),
                                      )
                                    ],
                                  ),
                                  StreamBuilder<List<ProductModel>>(
                                    stream: _filteredProductsController.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator(
                                            color: orange);
                                      } else if (!snapshot.hasData ||
                                          snapshot.data!.isEmpty) {
                                        return Center(
                                          child: Text(
                                            "No items found",
                                            style: TextStyle(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        );
                                      } else {
                                        filteredProducts = snapshot.data!;

                                        return SizedBox(
                                          height: height * 0.3,
                                          child: ListView.builder(
                                            itemCount: filteredProducts.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewProduct(
                                                        product:
                                                            filteredProducts[
                                                                index],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: ItemsCard(
                                                    itemImage:
                                                        filteredProducts[index]
                                                            .imageURL,
                                                    itemName:
                                                        filteredProducts[index]
                                                            .itemName,
                                                    itemPrice:
                                                        filteredProducts[index]
                                                            .price,
                                                    itemRating:
                                                        filteredProducts[index]
                                                            .ratings,
                                                    category:
                                                        filteredProducts[index]
                                                            .category,
                                                    quantity:
                                                        filteredProducts[index]
                                                            .quantity,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                      ].separate(20),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CustomBottomNavigation(
                currentIndex: _currentIndex,
                onTap: bottomNavigator,
              )),
          Positioned(
            left: 15,
            top: 35,
            child: IconButton(
              onPressed: () {
                if (_scaffold_Key.currentState != null) {
                  _scaffold_Key.currentState!.openDrawer();
                }
              },
              icon: const Icon(Icons.menu),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
