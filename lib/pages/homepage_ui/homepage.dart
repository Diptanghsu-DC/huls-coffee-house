import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/category/category_view.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenudrawer.dart';
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

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  List<ProductModel> filteredProducts = [];
  Stream<List<ProductModel>>? allProductStream;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    init();
  }

  void init() {
    allProductStream = ProductController.getAll();
  }

  Future<void> refresh() async {
    setState(() {
      init();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  Timer? _debounceTimer;

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

  @override
  Widget build(BuildContext context) {
    //getting the size of the screen
    getSize(context);

    return Stack(
      children: [
        Scaffold(
          key: _scaffoldkey,
          drawer: buildCustomDrawer(context),
          body: CustomBackground(
            bodyWidget: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
                top: 95.0,
              ),
              child: RefreshIndicator(
                onRefresh: refresh,
                color: orange,
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
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _searchController.text.isEmpty
                                    ? "Popular products"
                                    : "Search Results",
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
                          StreamBuilder<List<ProductModel>>(
                            stream: allProductStream,
                            builder: (context, snapshot) {
                              List<ProductModel> products = snapshot.data ?? [];
                              if (filteredProducts.isNotEmpty) {
                                products = filteredProducts;
                              } else {
                                List<ProductModel> new_products = products
                                    .where((element) => element.isPopular)
                                    .toList();
                                if (new_products.length >= 4) {
                                  products = new_products;
                                }
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

                              return SizedBox(
                                height: height * 0.4,
                                child: ListView.builder(
                                  itemCount:
                                      products.length > 4 ? 4 : products.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (products[index].quantity != 0) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ViewProduct(
                                                product: products[index],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ItemsCard(
                                          itemImage: products[index].imageURL,
                                          itemName: products[index].itemName,
                                          itemPrice: products[index].price,
                                          itemRating: products[index].ratings,
                                          itemDesc: products[index].itemDesc,
                                          quantity: products[index].quantity,
                                          isDisabled:
                                              products[index].isDisabled,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          "Swipe Right >>",
                          style: TextStyle(
                            fontSize: 20,
                            color: orange,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                      SizedBox(
                        width: width,
                        child: Column(
                          children: [
                            const Text(
                              "Developed by",
                              style: TextStyle(fontFamily: 'SofiaPro'),
                            ),
                            Image.asset(
                              "assets/images/ecell_logo.png",
                              height: 100,
                            )
                          ],
                        ),
                      )
                    ].separate(20),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 35,
          child: IconButton(
            onPressed: () {
              if (_scaffoldkey.currentState != null) {
                _scaffoldkey.currentState!.openDrawer();
              }
            },
            icon: const Icon(Icons.menu),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
