part of '../order_controller.dart';

Stream<List<OrderModel>> _getImpl({
  required String product,
  required String user,
  num? userPhone,
  bool forceGet = false,
}) async* {
  print("entering fetch from backend...");
  List<OrderModel> filteredModels = await _fetchFromBackend(
    product: product,
    user: user,
    forceGet: forceGet,
  );
  yield filteredModels;
}

Future<List<OrderModel>> _fetchFromBackend({
  required String product,
  required String user,
  num? userPhone,
  bool forceGet = false,
}) async {
  // Backend
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  print("database initialization done");
  print("setting query...");

  Query query = db;

  print("query set");

  query = query.where(OrderFields.user.name, isEqualTo: user);
  query = query.where(OrderFields.product.name, isEqualTo: product);

  print("query filtering done");

  QuerySnapshot querySnapshot = await query.get();

  print("query snapshot created");

  List<OrderModel> orders = [];

  if (querySnapshot.docs.isEmpty) {
    print("query found empty, returing users...");
    return orders;
  }

  List<Map<String, dynamic>> res = [
    querySnapshot.docs.first.data() as Map<String, dynamic>
  ];

  print("List of order created");
  // await db.find(selectorBuilder).toList();
  for (Map<String, dynamic> orderData in res) {
    OrderModel order = OrderModel.fromJson(orderData);
    orders.add(order);
  }
  print("returning the user");
  return orders;
}
