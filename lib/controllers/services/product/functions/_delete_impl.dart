part of '../product_controller.dart';

// import 'package:huls_coffee_house/models/models.dart';

Future<void> _deleteImpl(ProductModel product) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);
  Query query = collection;
  query.limit(1);
  query = query
      .where(ProductFields.itemName.name, isEqualTo: product.itemName)
      .where(ProductFields.category.name, isEqualTo: product.category);
  QuerySnapshot querySnapshot = await query.get();
  await ImageController.delete(publicID: product.imagePublicID);
  await querySnapshot.docs.first.reference.delete();
}
