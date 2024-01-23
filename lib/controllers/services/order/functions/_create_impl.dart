part of '../order_controller.dart';

Future<OrderModel?> _createImpl(OrderModel order) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  Query query = collection;
  query = query
      .where(OrderFields.product.name, isEqualTo: order.product)
      .where(OrderFields.user.name, isEqualTo: order.user);

  await OrderController._checkDuplicate(order);

  DocumentReference<Map<String, dynamic>> documentReference =
      await collection.add(order.toJson());

  print("order created with ID: ${documentReference.id}");

  QuerySnapshot querySnapshot = await query.get();

  Map<String, dynamic>? res = querySnapshot.docs.first as Map<String, dynamic>?;

  if (res == null) return null;
  order = OrderModel.fromJson(res);

  OrderController.orderQueue.add(order);
  UserController.orderList.add(order);

  return order;
}
