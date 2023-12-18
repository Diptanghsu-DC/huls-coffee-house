import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huls_coffee_house/models/models.dart';

part 'order_model.freezed.dart';

part 'order_model.g.dart';

@Freezed()
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required ProductModel product,
    required int quantity,
    required UserModel user,
    required DateTime time,
    @Default(false) bool isCompleted,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

enum OrderFields { product, quantity, user, time, isCompleted, lastLocalUpdate }
