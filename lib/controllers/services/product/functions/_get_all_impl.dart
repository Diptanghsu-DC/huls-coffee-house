part of '../product_controller.dart';

Stream<List<ProductModel>> _getAllImpl({
  bool forceGet = false,
}) async* {
  print("entering fetch from backend...");
  List<ProductModel> filteredModels = await _fetchAllFromBackend(
    forceGet: forceGet,
  );
  yield filteredModels;
}

Future<List<ProductModel>> _fetchAllFromBackend({
  bool forceGet = false,
}) async {
  // Backend
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  print("database initialization done");
  print("setting query...");

  Query query = db;

  print("query set");

  print("query filtering done");

  QuerySnapshot querySnapshot = await query.get();

  print("query snapshot created");

  List<ProductModel> products = [];

  if (querySnapshot.docs.isEmpty) {
    print("query found empty, returing users...");
    return products;
  }

  List<Map<String, dynamic>> res = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  print("List of order created");
  // await db.find(selectorBuilder).toList();
  for (Map<String, dynamic> orderData in res) {
    print(orderData);
    ProductModel product = ProductModel.fromJson(orderData);
    products.add(product);
  }
  print("returning the user");
  return products;
}
