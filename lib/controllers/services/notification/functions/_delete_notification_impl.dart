part of '../notification_controller.dart';

Future<void> _deleteNotificationImpl(NotificationModel notification) async {
  CollectionReference<Map<String, dynamic>> collection = FirebaseFirestore
      .instance
      .collection(NotificationController._collectionName);

  Query query = collection;
  query.limit(1);

  query = query
      .where(NotificationFields.sender.name, isEqualTo: notification.sender)
      .where(NotificationFields.receiver.name, isEqualTo: notification.receiver)
      .where(NotificationFields.product.name, isEqualTo: notification.product);

  QuerySnapshot querySnapshot = await query.get();

  await querySnapshot.docs.first.reference.delete();
}
