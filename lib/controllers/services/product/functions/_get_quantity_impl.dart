part of '../product_controller.dart';

Future<num> _getQuantityImpl(ProductModel product) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  Query query = collection;
  query = query.where(ProductFields.itemName.name, isEqualTo: product.itemName);

  QuerySnapshot querySnapshot = await query.get();

  final res = querySnapshot.docs.first.data() as Map<String, dynamic>;

  final myProduct = ProductModel.fromJson(res);

  return myProduct.quantity;
}
