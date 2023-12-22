part of '../product_controller.dart';

// Future<ProductModel> _saveImpl(ProductModel product) async {
//   List<String> data = LocalDatabase.get(LocalDocuments.products.name);

//   Map products = data.isEmpty ? {} : jsonDecode(data[0]);
//   product = product.copyWith(lastLocalUpdate: DateTime.now());
//   // products[product.] = product.toJson();

//   await LocalDatabase.set(
//     LocalDocuments.products.name,
//     [jsonEncode(products)],
//   );
//   return product;
// }
