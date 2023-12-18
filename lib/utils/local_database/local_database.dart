import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/models.dart';
import 'constants.dart';
export 'constants.dart';

/// The data is assumed to be either directly as a json value
/// Or a list of json value
/// Or a Map of json value
///
/// Each value must contain lastLocalUpdate
/// Necessary for removing stale data
class LocalDatabase {
  static const Duration stalePeriod = Duration(days: 7);
  static late SharedPreferences sharedPreferences;

  const LocalDatabase._();
  static bool didInit = false;

  static Future<void> init() async {
    if (didInit) return;
    sharedPreferences = await SharedPreferences.getInstance();
    await _removeStaleData();
    didInit = true;
  }

  static List<String> get(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }

  static Future<void> set(
      String key,
      List<String> data,
      ) async {
    if (data.isEmpty) {
      await deleteKey(key);
    } else {
      await sharedPreferences.setStringList(key, data);
    }
  }

  static Future<void> deleteKey(String key) async {
    if (sharedPreferences.containsKey(key)) {
      await sharedPreferences.remove(key);
    }
  }

  static Future<void> deleteAll() async {
    await sharedPreferences.clear();
  }

  static bool _canKeepData(Map? item) {
    if (item == null || item[UserFields.lastLocalUpdate.name] == null) {
      return false;
    }

    DateTime oldDate = DateTime.parse(item[UserFields.lastLocalUpdate.name]);
    return DateTime.now().difference(oldDate) < stalePeriod;
  }

  static Future<void> _removeStaleDataFromBox(LocalDocuments collection) async {
    for (LocalDocuments key in LocalDocuments.values) {
      if (sharedPreferences.containsKey(key.name)) {
        dynamic data = sharedPreferences.getStringList(key.name);
        List<String> filteredData = [];
        for (String item in data) {
          if (_canKeepData(jsonDecode(item))) {
            filteredData.add(item);
          }
        }
        await set(key.name, filteredData);
      }
    }
  }

  static Future<void> _removeStaleData() async {
    for (LocalDocuments doc in LocalDocuments.values) {
      await _removeStaleDataFromBox(doc);
    }
  }
}
