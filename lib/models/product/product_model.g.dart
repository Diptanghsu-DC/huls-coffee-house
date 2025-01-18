// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      imageURL: json['imageURL'] as String,
      imagePublicID: json['imagePublicID'] as String,
      itemName: json['itemName'] as String,
      itemDesc: json['itemDesc'] as String?,
      category: json['category'] as String,
      price: json['price'] as num,
      quantity: json['quantity'] as num,
      ratings: json['ratings'] as num?,
      discount: json['discount'] as int?,
      lastLocalUpdate: json['lastLocalUpdate'] == null
          ? null
          : DateTime.parse(json['lastLocalUpdate'] as String),
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      isPopular: json['isPopular'] as bool? ?? false,
      isDisabled: json['isDisabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'imageURL': instance.imageURL,
      'imagePublicID': instance.imagePublicID,
      'itemName': instance.itemName,
      'itemDesc': instance.itemDesc,
      'category': instance.category,
      'price': instance.price,
      'quantity': instance.quantity,
      'ratings': instance.ratings,
      'discount': instance.discount,
      'lastLocalUpdate': instance.lastLocalUpdate?.toIso8601String(),
      'createTime': instance.createTime?.toIso8601String(),
      'isPopular': instance.isPopular,
      'isDisabled': instance.isDisabled,
    };
