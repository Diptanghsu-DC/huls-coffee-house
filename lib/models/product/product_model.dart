import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String imageURL,
    required String itemName,
    required String itemDesc,
    required String category,
    required num price,
    required num ratings,
    @Default(true) bool isAvailable,
  }) = _UserModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

enum ProductFields {
  imageURL,
  itemName,
  itemDesc,
  category,
  price,
  ratings,
  lastLocalUpdate,
}
