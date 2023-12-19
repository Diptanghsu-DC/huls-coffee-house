// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as num,
      isSeller: json['isSeller'] as bool? ?? false,
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'isSeller': instance.isSeller,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
    };
