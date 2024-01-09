part of '../product_controller.dart';

Future<ProductModel?> _createImpl(ProductModel product) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  Query query = collection;
  query = query
      .where(ProductFields.itemName.name, isEqualTo: product.itemName)
      .where(ProductFields.price.name, isEqualTo: product.price);

  await ProductController._checkDuplicate(product);

  DocumentReference<Map<String, dynamic>> documentReference =
      await collection.add(product.toJson());

  print("document created with ID: ${documentReference.id}");

  QuerySnapshot querySnapshot = await query.get();

  Map<String, dynamic>? res =
      querySnapshot.docs.first.data() as Map<String, dynamic>?;

  if (res == null) return null;
  product = ProductModel.fromJson(res);
  // product = await ProductController._save(product);
  return product;
}
