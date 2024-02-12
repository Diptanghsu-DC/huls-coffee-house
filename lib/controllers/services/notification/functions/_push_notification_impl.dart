part of '../notification_controller.dart';

Future<NotificationModel?> _pushNotificationImpl(
    NotificationModel notification) async {
  CollectionReference<Map<String, dynamic>> collection = FirebaseFirestore
      .instance
      .collection(NotificationController._collectionName);

  Query query = collection;
  query = query
      .where(NotificationFields.sender.name, isEqualTo: notification.sender)
      .where(NotificationFields.receiver.name,
          isEqualTo: notification.receiver);
  print("product filtering done. found product");
  print("$query");

  // bool isDuplicate = await ProductController._checkDuplicate(product);

  // print("is duplicate : $isDuplicate");

  // if (!isDuplicate) {
  DocumentReference<Map<String, dynamic>> documentReference =
      await collection.add(notification.toJson());

  print("document created with ID: ${documentReference.id}");

  QuerySnapshot querySnapshot = await query.get();

  Map<String, dynamic>? res =
      querySnapshot.docs.first.data() as Map<String, dynamic>?;

  if (res == null) return null;
  notification = NotificationModel.fromJson(res);
  // product = await ProductController._save(product);
  return notification;
  // }
}
