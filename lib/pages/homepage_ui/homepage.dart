import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/category/category_view.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/popular/popular_viewer.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenudrawer.dart';
import 'package:huls_coffee_house/widgets/custom_bottom_navigation_bar/custom_bottom_navigation.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';
import 'package:huls_coffee_house/pages/pages.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  static const String routeName = "/homePage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 2;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<ProductModel> filteredProducts = [];

  final StreamController<List<ProductModel>> _filteredProductsController =
      StreamController<List<ProductModel>>();

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

  void filterProducts(String searchValue) async {
    Stream<List<ProductModel>> allProductStream =
        ProductController.getAll(forceGet: true);
    await for (List<ProductModel> allProductsList in allProductStream) {
      // Filter products based on the search value
      filteredProducts = allProductsList.where((product) {
        // Perform case-insensitive search on product names
        return product.itemName
            .toLowerCase()
            .contains(searchValue.toLowerCase());
      }).toList();
      _filteredProductsController.add(filteredProducts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //getting the size of the screen
    getSize(context);

    return WillPopScope(
      onWillPop: () async {
        final quitCondition = await showExitWarning(context);
        return quitCondition ?? false;
      },
      child: Stack(
        children: [
          Scaffold(
              key: _scaffoldKey,
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
                            setState(() {
                              filterProducts(value);
                            });
                          },
                        ),
                        //category view
                        const CategoryViewer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                style: TextStyle(fontFamily: 'SofiaPro'),
                              ),
                            )
                          ],
                        ),
                        //view popular items
                        (filteredProducts.isEmpty)
                            ? const PopularViewer(
                                imgSrc: null,
                                ratings: null,
                                price: 35.5,
                                itemName: "Salmon Salad",
                                itemDesc: "a item",
                              )
                            : StreamBuilder<List<ProductModel>>(
                                stream: _filteredProductsController.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    filteredProducts = snapshot.data!;

                                    return Column(
                                      children: filteredProducts.map((product) {
                                        return ListTile(
                                          title: Text(product.itemName),
                                          subtitle: Text(product.category),
                                        );
                                      }).toList(),
                                    );
                                  } else {
                                    return const CircularProgressIndicator(
                                      color: orange,
                                    ); // or a placeholder widget
                                  }
                                },
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
                if (_scaffoldKey.currentState != null) {
                  _scaffoldKey.currentState!.openDrawer();
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
