part of '../notification_controller.dart';

Stream<List<NotificationModel>> _getImpl({
  required String receiver,
}) async* {
  List<NotificationModel> filteredModels =
      await _fetchFromBackend(receiver: receiver);
  yield filteredModels;
}

Future<List<NotificationModel>> _fetchFromBackend({
  required String receiver,
}) async {
  CollectionReference<Map<String, dynamic>> collection = FirebaseFirestore
      .instance
      .collection(NotificationController._collectionName);

  // print("database initialization done");
  // print("setting query...");

  Query query = collection;

  // print("query set");

  query = query.where(NotificationFields.receiver.name, isEqualTo: receiver);

  // print("query filtering done");

  QuerySnapshot querySnapshot = await query.get();

  // print("query snapshot created");

  List<NotificationModel> notifications = [];

  if (querySnapshot.docs.isEmpty) {
    // print("query found empty, returning orders...");
    return notifications;
  }

  // List<Map<String, dynamic>> res = [
  //   querySnapshot.docs.first.data() as Map<String, dynamic>
  // ];

  List<Map<String, dynamic>> res = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  // print("List of order created");

  for (Map<String, dynamic> notificationData in res) {
    NotificationModel notification =
        NotificationModel.fromJson(notificationData);
    notifications.add(notification);
  }
  // print("returning the orders");
  return notifications;
}
