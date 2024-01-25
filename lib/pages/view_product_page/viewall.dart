import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/services/product/product_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/itemscard.dart';

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

  Future<void> refresh() async{
    setState(() {
      widget.category == null
          ? ProductController.getAll()
          : ProductController.get(category: widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Scaffold(
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
      ),
      body: SafeArea(
        child: Column(children: [
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
                  return Expanded(
                    child: snapshot.connectionState == ConnectionState.waiting
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ViewProduct(
                                                product: products[index]),
                                          ));
                                    },
                                    child: ItemsCard(
                                      itemImage: products[index].imageURL,
                                      itemName: products[index].itemName,
                                      itemPrice: products[index].price,
                                      itemRating: products[index].ratings,
                                      category: products[index].category,
                                      quantity: products[index].quantity,
                                    ),
                                  );
                                },
                              ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
