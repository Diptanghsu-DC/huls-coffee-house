import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/item_box.dart';

class ProductStream extends StatefulWidget {
  const ProductStream({super.key});

  @override
  State<ProductStream> createState() => _ProductStreamState();
}

class _ProductStreamState extends State<ProductStream> {
  @override
  Widget build(context) {
    // Stream<List<ProductModel>> productStream = ProductController.getAll();
    return StreamBuilder<List<ProductModel>>(
      stream: ProductController.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // return const Text('Loading...');
          return const Center(child: CircularProgressIndicator());
        } else {
          final products = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ItemBox(
                item: Item(product: products[index]),
              ),
            ),
          );
        }
      },
    );
  }
}
