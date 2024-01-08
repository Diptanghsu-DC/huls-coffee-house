part of '../order_controller.dart';

Stream<List<OrderModel>> _getAllImpl({
  bool forceGet = false,
}) async* {
  print("entering fetch from backend...");
  List<OrderModel> filteredModels = await _fetchAllFromBackend(
    forceGet: forceGet,
  );
  yield filteredModels;
}

Future<List<OrderModel>> _fetchAllFromBackend({
  bool forceGet = false,
}) async {
  // Backend
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  print("database initialization done");
  print("setting query...");

  Query query = db.orderBy('time');

  print("query set");

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
    print(orderData);
    OrderModel order = OrderModel.fromJson(orderData);
    orders.add(order);
  }
  print("returning the user");
  return orders;
}
