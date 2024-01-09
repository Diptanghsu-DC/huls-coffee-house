import 'package:flutter/material.dart';
import 'package:huls_coffee_house/models/models.dart';

class Item {
  ProductModel product;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  int counter = 0;
  Item({required this.product});
}
