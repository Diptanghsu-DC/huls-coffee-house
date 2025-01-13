part of '../order_controller.dart';

Future<void> _countdownTimerImpl(OrderModel order, int delay) async {
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

    while (delay >= 0) {
      Map<String, dynamic> newData = {
        "delay": delay,
      };
      document.update(newData);
      delay--;
      await Future.delayed(const Duration(seconds: 60));
    }
    // await UserController._save(user: UserController.currentUser);
  }
}
