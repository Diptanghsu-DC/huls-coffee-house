import 'package:flutter/material.dart';
import 'package:huls_coffee_house/models/models.dart';

class Item {
  ProductModel? product;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Item({this.product});

  num get count {
    return product == null ? 0 : product!.quantity;
  }
}
