part of '../product_controller.dart';

Future<ProductModel?> _createImpl(ProductModel product) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  Query query = collection;
  query = query
      .where(ProductFields.itemName.name, isEqualTo: product.itemName)
      .where(ProductFields.category.name, isEqualTo: product.category);
  print("product filtering done. found product");
  print("$query");

  bool isDuplicate = await ProductController._checkDuplicate(product);

  print("is duplicate : $isDuplicate");

  if (!isDuplicate) {
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
  return product;
}
