part of '../order_controller.dart';

Stream<List<OrderModel>> _getImpl({
  String? product,
  required String user,
  num? userPhone,
  bool forceGet = false,
}) async* {
  // print("entering fetch from backend...");
  while (true) {
    List<OrderModel> filteredModels = await _fetchFromBackend(
      product: product,
      user: user,
      userPhone: userPhone,
      forceGet: forceGet,
    );
    yield filteredModels;
    await Future.delayed(const Duration(seconds: 100));
  }
}

Future<List<OrderModel>> _fetchFromBackend({
  String? product,
  required String user,
  num? userPhone,
  bool forceGet = false,
}) async {
  // Backend
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  // print("database initialization done");
  // print("setting query...");

  Query query = db;

  // print("query set");

  query = query.where(OrderFields.user.name, isEqualTo: user);

  if (product != null) {
    // print("2nd query");
    query = query.where(OrderFields.product.name, isEqualTo: product);
  }

  // print("query filtering done");

  QuerySnapshot querySnapshot = await query.get();

  // print("query snapshot created");

  List<OrderModel> orders = [];

  if (querySnapshot.docs.isEmpty) {
    // print("query found empty, returning orders...");
    return orders;
  }

  // List<Map<String, dynamic>> res = [
  //   querySnapshot.docs.first.data() as Map<String, dynamic>
  // ];

  List<Map<String, dynamic>> res = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  // print("List of order created");

  for (Map<String, dynamic> orderData in res) {
    OrderModel order = OrderModel.fromJson(orderData);
    orders.add(order);
  }
  // print("returning the orders");
  return orders;
}
