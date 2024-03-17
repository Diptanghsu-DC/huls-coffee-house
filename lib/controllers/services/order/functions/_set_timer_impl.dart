part of '../order_controller.dart';

Future<void> _setTimerImpl(OrderModel order, int delay) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(OrderController._collectionName);

  Query query = collection;

  // query.limit(1);
  query = query
      .where(OrderFields.user.name, isEqualTo: order.user)
      .where(OrderFields.product.name, isEqualTo: order.product);

  QuerySnapshot querySnapshot = await query.get();

  if (querySnapshot.docs.isEmpty) {
  } else {
    final documentId = querySnapshot.docs.first.id;

    final document = collection.doc(documentId);

    // final updateUser = newUser ?? UserController.currentUser;

    Map<String, dynamic> newData = {
      "isDelaySet": true,
      "delay": delay,
    };

    document.update(newData);
    // await UserController._save(user: UserController.currentUser);
  }
}
