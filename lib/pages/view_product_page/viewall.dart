import 'package:flutter/material.dart';
import 'package:huls_coffee_house/controllers/services/product/product_controller.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/itemscard.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

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

  void _tabbar(int tabnumber) {
    setState(() {
      if (tabnumber == 1) {
        tabcolor1 = const Color(0xFFFF5527);
        tabcolor2 = Colors.white;
        text2 = Colors.black;
        text1 = Colors.white;
        num1 = 0.444;
        num2 = 0.375;
      }
      if (tabnumber == 2) {
        tabcolor2 = const Color(0xFFFF5527);
        tabcolor1 = Colors.white;
        text1 = Colors.black;
        text2 = Colors.white;
        num2 = 0.444;
        num1 = 0.375;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    final double height = screensize.height;
    final double width = screensize.width;
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.fromLTRB(
              width * 0.052, height * 0.123, width * 0.05, 0),
          width: width * 0.897,
          height: height * 0.068,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF2EAEA)),
              borderRadius: BorderRadius.circular(27.50),
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
                _tabbar(1);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(width * 0.017, height * 0.005,
                    width * 0.035, height * 0.005),
                width: width * num1,
                height: height * 0.058,
                decoration: ShapeDecoration(
                  color: tabcolor1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.50),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3FD3D1D8),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Text(
                  'Baked',
                  style: TextStyle(color: text1),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _tabbar(2);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(
                    0, height * 0.005, width * 0.020, height * 0.005),
                width: width * num2,
                height: height * 0.058,
                decoration: ShapeDecoration(
                  color: tabcolor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.50),
                  ),
                ),
                child: Text(
                  'Packed??',
                  style: TextStyle(color: text2),
                ),
              ),
            )
          ]),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.055, height * 0.04, width * 0.055, 0),
              child: StreamBuilder<List<ProductModel>>(
                stream: ProductController.get(),
                builder: (context, snapshot) {
                  List<ProductModel> products = [];
                  if (snapshot.hasData) {
                    products = snapshot.data ?? [];
                  }
                  return Expanded(
                      child: snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: CircularProgressIndicator(),
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
                                      ),
                                    );
                                  },
                                ));
                },
              )),
        ),
      ]),
    );
  }
}
