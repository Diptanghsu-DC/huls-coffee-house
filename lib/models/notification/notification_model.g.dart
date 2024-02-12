// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      title: json['title'] as String,
      message: json['message'] as String,
      sender: json['sender'] as String,
      receiver: json['receiver'] as String,
      product: json['product'] as String?,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'product': instance.product,
      'time': instance.time.toIso8601String(),
    };
