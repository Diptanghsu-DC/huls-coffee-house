part of '../product_controller.dart';

Stream<List<ProductModel>> _getAllImpl({
  bool forceGet = false,
}) async* {
  // print("entering fetch from backend...");
  while (true) {
    List<ProductModel> filteredModels = await _fetchAllFromBackend(
      forceGet: forceGet,
    );
    yield filteredModels;
    await Future.delayed(const Duration(seconds: 100));
  }
}

Future<List<ProductModel>> _fetchAllFromBackend({
  bool forceGet = false,
}) async {
  // Backend
  // Completer<QuerySnapshot> completer = Completer<QuerySnapshot>();

  // Backend
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(ProductController._collectionName);

  // print("database initialization done");
  // print("setting query...");

  // StreamSubscription<QuerySnapshot>? subscription;
  // subscription = db.snapshots().listen((QuerySnapshot querySnapshot) {
  //   // Unsubscribe after the first event
  //   subscription!.cancel();

  //   // Complete the completer with the first QuerySnapshot
  //   completer.complete(querySnapshot);
  // });

  Query query = db;

  // print("query set");
  // print("query filtering done");

  // Wait for the first QuerySnapshot to be received
  // QuerySnapshot currentQuerySnap = await completer.future;

  QuerySnapshot querySnapshot = await query.get();

  // print("query snapshot created");

  List<ProductModel> products = [];

  if (querySnapshot.docs.isEmpty) {
    // print("query found empty, returning products...");
    return products;
  }

  List<Map<String, dynamic>> res = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  // print("List of product created");
  // print(res);

  for (Map<String, dynamic> productData in res) {
    // print(productData);
    ProductModel product = ProductModel.fromJson(productData);
    products.add(product);
  }
  // print("returning the product");
  return products;
}
