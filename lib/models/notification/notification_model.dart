import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@Freezed()
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String title,
    required String message,
    required String sender,
    required String receiver,
    String? product,
    required DateTime time,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

enum NotificationFields {
  title,
  message,
  sender,
  receiver,
  product,
  time,
}
