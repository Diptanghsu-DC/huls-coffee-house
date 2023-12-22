import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/models/order/order_model.dart';
import 'package:huls_coffee_house/utils/local_database/local_database.dart';
import 'package:huls_coffee_house/utils/utils.dart';

part 'functions/_create_impl.dart';
part 'functions/_check_duplicate.dart';
part 'functions/_delete_impl.dart';

class OrderController {
  static const String _collectionName = "orders";
  static List<OrderModel> orderQueue = [];
  const OrderController._();

  static Future<OrderModel?> create(OrderModel order) async {
    return await _createImpl(order);
  }

  static Future<void> _checkDuplicate(OrderModel order) async {
    return await _checkDuplicateImpl(order);
  }

  /// Deletes the order when completed or cancelled
  static Future<void> delete(OrderModel order) async {
    return await _deleteImpl(order);
  }
}
