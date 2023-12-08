import 'dart:io';

enum Status { unavailable, available }

//food model
class FoodModel {
  const FoodModel({
    required this.imageURL,
    required this.itemName,
    required this.itemDesc,
    required this.category,
    required this.price,
    required this.ratings,
  });

  final String? imageURL;
  final String category;
  final String itemName;
  final String? itemDesc;
  final num price;
  final num? ratings;

  Status get type {
    //to be modified according to database
    return Status.available;
  }
}
