import 'dart:io';

enum Status { available, unavailable }

//food model
class FoodModel {
  const FoodModel({
    File? image,
    required String itemName,
    required String category,
    required int price,
    int? ratings,
  });

  Status get type {
    //to be modified according to database
    return Status.available;
  }
}
