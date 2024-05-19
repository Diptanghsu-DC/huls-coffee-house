import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/controllers/services/product/product_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/itemscard.dart';
import 'package:huls_coffee_house/utils/toast_message.dart';

class ViewAll extends StatefulWidget {
  ViewAll({super.key, this.category});

  String? category;

  static const String routeName = '/viewall';

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  Color tabcolor1 = const Color(0xFFFF5527);
  Color tabcolor2 = Colors.white;
  Color text1 = Colors.white;
  Color text2 = Colors.black;
  double num1 = 0.444;
  double num2 = 0.375;
  List<bool> categoryDisable = [false];
  int listLen = 0;
  List<ProductModel> allproducts = [];

  Future<void> refresh() async {
    setState(() {
      widget.category == null
          ? ProductController.getAll()
          : ProductController.get(category: widget.category);
    });
  }

  Future<void> init() async {
    if (widget.category != null) {
      allproducts =
          await ProductController.get(category: widget.category).first;
      categoryDisable[0] = allproducts[0].isDisabled;
      listLen = allproducts.length;
    } else {
      listLen =
          await ProductController.getAll().first.then((value) => value.length);
    }
    refresh();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return RefreshIndicator(
      onRefresh: refresh,
      color: orange,
      child: Scaffold(
        appBar: AppBar(
          leading: const GoBackButton(),
          title: Text(
            widget.category == null ? "All products" : widget.category!,
            style: TextStyle(
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
                height: 1,
                fontFamily: 'SofiaPro'),
          ),
          centerTitle: true,
          actions: [
            Visibility(
              visible: UserController.currentUser!.isSeller,
              child: ToggleButtons(
                isSelected: categoryDisable,
                onPressed: (idx) async {
                  toastMessage("Deactivating category. Please wait", context);
                  categoryDisable[idx] = !categoryDisable[idx];
                  for (var i = 0; i < listLen; i++) {
                    ProductModel product = allproducts[i]
                        .copyWith(isDisabled: categoryDisable[idx]);
                    await ProductController.create(product);
                  }
                  toastMessage("Category deactivated successfully", context);
                  refresh();
                },
                selectedColor: Colors.red,
                selectedBorderColor: Colors.red,
                fillColor: Color.fromARGB(255, 241, 180, 180),
                children: const [
                  Icon(Icons.block),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      width * 0.055, height * 0.04, width * 0.055, 0),
                  child: StreamBuilder<List<ProductModel>>(
                    stream: widget.category == null
                        ? ProductController.getAll()
                        : ProductController.get(category: widget.category),
                    builder: (context, snapshot) {
                      List<ProductModel> products = [];
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        products = snapshot.data ?? [];
                      }
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: CircularProgressIndicator(
                                  color: orange,
                                ),
                              ),
                            )
                          : products.isEmpty
                              ? const Center(
                                  child: Text(
                                    "No product found",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if ((products[index].quantity != 0 &&
                                                !products[index].isDisabled) ||
                                            UserController
                                                .currentUser!.isSeller) {
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
                                        padding:
                                            const EdgeInsets.only(bottom: 12.0),
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
                                  // ),
                                );
                    },
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
