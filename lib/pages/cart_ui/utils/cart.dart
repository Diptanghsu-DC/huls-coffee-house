import 'package:flutter/material.dart';
import 'package:huls_coffee_house/controllers/services/user/user_controller.dart';
import 'package:huls_coffee_house/models/models.dart';

class Cart extends ChangeNotifier {
  void addToCart(ProductModel product) {
    UserController.cartList.add(product);
    notifyListeners();
  }
}
