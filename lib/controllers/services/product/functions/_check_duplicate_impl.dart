part of '../product_controller.dart';

Future<void> _checkDuplicateImpl(ProductModel product) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  Query query = collection;
  query = query
      .where(ProductFields.itemName.name, isEqualTo: product.itemName)
      .where(ProductFields.price.name, isEqualTo: product.price);

  QuerySnapshot querySnapshot = await query.get();

  if (querySnapshot.docs.isNotEmpty) {
    throw Exception("Same item exists, please check inventory");
  }
}
