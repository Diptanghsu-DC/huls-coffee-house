//only for testing UI
class ItemModel {
  String itemName;
  int? itemPrice;
  String itemSubname;
  double? itemRating;
  String itemImage;

  ItemModel(
      {required this.itemName,
      this.itemPrice,
      this.itemRating,
      required this.itemSubname,
      required this.itemImage});
}
