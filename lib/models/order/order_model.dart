import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huls_coffee_house/models/models.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@Freezed()
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String product,
    required num quantity,
    required num price,
    required String user,
    required num userPhone,
    required String userEmail,
    required String address,
    required DateTime time,
    @Default(false) bool isDelaySet,
    int? delay,
    DateTime? lastLocalUpdate,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

enum OrderFields {
  product,
  quantity,
  price,
  user,
  userPhone,
  userEmail,
  address,
  time,
  isDelaySet,
  delay,
  lastLocalUpdate
}
