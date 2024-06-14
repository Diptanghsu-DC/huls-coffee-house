part of '../order_controller.dart';

Future<void> _checkDuplicateImpl(OrderModel order) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  Query query = collection;
  query = query
      .where(OrderFields.product.name, isEqualTo: order.product)
      .where(OrderFields.userEmail.name, isEqualTo: order.userEmail);

  QuerySnapshot querySnapshot = await query.get();

  if (querySnapshot.docs.isNotEmpty) {
    throw Exception(
        "Same order given before, please wait for that completion or cancel and give fresh order");
  }
}
