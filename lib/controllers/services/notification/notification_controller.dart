import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huls_coffee_house/models/models.dart';

part 'functions/_push_notification_impl.dart';
part 'functions/_delete_notification_impl.dart';
part 'functions/_get_impl.dart';

class NotificationController {
  static const String _collectionName = "notifications";
  const NotificationController._();

  static Future<NotificationModel?> pushNotification(
      NotificationModel notification) async {
    return await _pushNotificationImpl(notification);
  }

  static Future<void> deleteNotification(NotificationModel notification) async {
    return _deleteNotificationImpl(notification);
  }

  static Stream<List<NotificationModel>> get({
    required String receiver,
  }) {
    return _getImpl(receiver: receiver);
  }
}
