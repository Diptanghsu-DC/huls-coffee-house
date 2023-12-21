// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      time: DateTime.parse(json['time'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'user': instance.user,
      'time': instance.time.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
    };
