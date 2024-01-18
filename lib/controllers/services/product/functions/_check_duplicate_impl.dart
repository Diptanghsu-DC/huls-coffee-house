part of '../product_controller.dart';

Future<bool> _checkDuplicateImpl(ProductModel product) async {
  print("entered check duplicate");
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  bool isDuplicate = false;

  Query query = collection;
  query = query
      .where(ProductFields.itemName.name, isEqualTo: product.itemName)
      .where(ProductFields.category.name, isEqualTo: product.category);

  QuerySnapshot querySnapshot = await query.get();

  print("query created : $query");

  if (querySnapshot.docs.isNotEmpty) {
    // throw Exception("Same item exists, please check inventory");
    final documentId = querySnapshot.docs.first.id;

    final document = collection.doc(documentId);

    print("document created");

    Map<String, dynamic> newData = {
      "itemName": product.itemName,
      "itemDesc": product.itemDesc,
      "category": product.category,
      "price": product.price,
      "quantity": product.quantity,
      "ratings": product.ratings,
      "imageURL": product.imageURL,
      "lastLocalUpdate": product.lastLocalUpdate,
    };

    print("new data created");

    document.update(newData);

    print("document updated");

    isDuplicate = true;
  }
  return isDuplicate;
}
