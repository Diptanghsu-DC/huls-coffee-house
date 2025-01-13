// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      deviceToken: json['deviceToken'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as num,
      address: json['address'] as String,
      isSeller: json['isSeller'] as bool? ?? false,
      newNotification: json['newNotification'] as bool? ?? false,
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'deviceToken': instance.deviceToken,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'address': instance.address,
      'isSeller': instance.isSeller,
      'newNotification': instance.newNotification,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
    };
