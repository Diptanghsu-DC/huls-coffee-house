// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      imageURL: json['imageURL'] as String?,
      itemName: json['itemName'] as String,
      itemDesc: json['itemDesc'] as String?,
      category: json['category'] as String,
      price: json['price'] as num,
      quantity: json['quantity'] as num,
      ratings: json['ratings'] as num?,
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'imageURL': instance.imageURL,
      'itemName': instance.itemName,
      'itemDesc': instance.itemDesc,
      'category': instance.category,
      'price': instance.price,
      'quantity': instance.quantity,
      'ratings': instance.ratings,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
    };
