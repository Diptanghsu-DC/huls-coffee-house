import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String imageURL,
    required String imagePublicID,
    required String itemName,
    String? itemDesc,
    required String category,
    required num price,
    required num quantity,
    num? ratings,
    int? discount,
    DateTime? lastLocalUpdate,
    DateTime? createTime,
    @Default(false) bool isPopular,
    @Default(false) bool isDisabled,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  bool get isAvailable {
    if (quantity == 0) {
      return false;
    } else {
      return true;
    }
  }
  bool get isNew {
    return createTime!=null && DateTime.now().difference(createTime!).inDays<=30 ;
  }
}

enum ProductFields {
  imageURL,
  imagePublicID,
  itemName,
  itemDesc,
  category,
  price,
  ratings,
  quantity,
  discount,
  isPopular,
  isDisabled,
  lastLocalUpdate,
  createTime,
}
