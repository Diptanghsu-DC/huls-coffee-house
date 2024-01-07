import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String imageURL,
    required String itemName,
    required String itemDesc,
    required String category,
    required num price,
    required num quantity,
    num? ratings,
    DateTime? lastLocalUpdate,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  bool get isAvailable {
    if (quantity == 0) {
      return true;
    } else {
      return false;
    }
  }
}

enum ProductFields {
  imageURL,
  itemName,
  itemDesc,
  category,
  price,
  ratings,
  quantity,
  lastLocalUpdate,
}
