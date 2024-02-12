import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/utils/database/constants.dart';
import 'package:huls_coffee_house/utils/local_database/local_database.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'functions/_create_impl.dart';
part 'functions/_save_impl.dart';
part 'functions/_login_impl.dart';
part 'functions/_gather_data.dart';
part 'functions/_get_impl.dart';
part 'functions/_delete_impl.dart';
part 'functions/_login_silently_impl.dart';
part 'functions/_cart_impl.dart';
part 'functions/_update_impl.dart';
part 'functions/_get_admin_impl.dart';

class UserController {
  static const String _collectionName = "users";
  static UserModel? currentUser;
  static List<ProductModel> cartList = [];
  static List<OrderModel> orderList = [];
  const UserController._();

  static Future<void> _checkDuplicate(UserModel user) async {
    if ((await get(email: user.email, forceGet: true).first).isNotEmpty) {
      throw Exception("User exists with the provided email. Please Log in");
    }
  }

  // static Future<void> addToCart(ProductModel product) async {
  //   return _cartImpl();
  // }

  /// Creates a user
  ///  * If user exists throws exception
  ///  * Hashes the password
  ///  * If user doesn't exist creates it
  ///
  /// Stores the value in local database
  /// Stores the value in currentUser field
  static Future<UserModel?> create(UserModel user) async {
    return await _createImpl(user);
  }

  static Future<UserModel?> _save({UserModel? user}) async {
    return await _saveImpl(user: user);
  }

  //not required currently
  // static Future<void> _gatherData() async {
  //   return await _gatherDataImpl();
  // }

  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    UserModel? user = await _loginImpl(
      email: email,
      password: password,
    );
    // if (user != null) {
    //   await _gatherData();
    // }
    return user;
  }

  static Stream<UserModel?> loginSilently({bool forceGet = false}) {
    return _loginSilentlyImpl(forceGet: forceGet);
  }

  static Stream<List<UserModel>> get({
    required String email,
    String? id,
    String? nameStartsWith,
    bool keepPassword = false,
    bool forceGet = false,
  }) {
    return _getImpl(
      email: email,
      id: id,
      nameStartsWith: nameStartsWith,
      keepPassword: keepPassword,
      forceGet: forceGet,
    );
  }

  static Future<UserModel> getAdmin() {
    return _getAdminImpl();
  }

  /// Deletes the user if exists from both local database and server
  static Future<void> delete() async {
    return await _deleteImpl();
  }

  static Future<void> logOut() async {
    currentUser = null;
    await _save();
    debugPrint("logged out");
  }

  static Future<void> update({UserModel? oldUser}) async {
    await _updateImpl(oldUser: oldUser);
  }
}
