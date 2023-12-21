part of '../order_controller.dart';

Future<void> _deleteImpl(OrderModel order) async {
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  Query query = db;
  query.limit(1);

  query = query
      .where(OrderFields.product.name, isEqualTo: order.product)
      .where(OrderFields.user.name, isEqualTo: order.user);

  QuerySnapshot querySnapshot = await query.get();

  await querySnapshot.docs.first.reference.delete();

  OrderController.orderQueue.removeAt(0);
}
