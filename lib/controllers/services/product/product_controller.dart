import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/utils/local_database/local_database.dart';
import 'package:huls_coffee_house/utils/utils.dart';

part 'functions/_create_impl.dart';
part 'functions/_check_duplicate_impl.dart';
part 'functions/_save_impl.dart';
part 'functions/_get_impl.dart';
part 'functions/_get_all_impl.dart';

class ProductController {
  static const String _collectionName = "products";
  const ProductController._();

  static Future<ProductModel?> create(ProductModel product) async {
    return await _createImpl(product);
  }

  static Future<void> _checkDuplicate(ProductModel product) async {
    return await _checkDuplicateImpl(product);
  }

  // static Future<ProductModel> _save(ProductModel product) async {
  //   return await _saveImpl(product);
  // }

  /// For a given id returns all the data of the product
  static Stream<List<ProductModel>> get({
    String? id,
    String? category,
    String? itemName,
    bool forceGet = false,
  }) {
    return _getImpl(
      id: id,
      category: category,
      itemName: itemName,
      forceGet: forceGet,
    );
  }

  static Stream<List<ProductModel>> getAll({
    bool forceGet = false,
  }) {
    return _getAllImpl(
      forceGet: forceGet,
    );
  }

  static Future<void> delete(String id) async {
    throw UnimplementedError();
  }
}
