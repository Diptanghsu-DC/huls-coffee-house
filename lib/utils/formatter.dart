import 'package:intl/intl.dart';

class Formatter {
  const Formatter._();

  static String dateTime(DateTime dateTime) {
    final formatter = DateFormat('h:mm a, MMM d');
    return formatter.format(dateTime);
  }

  static String dateOnly(DateTime dateTime) {
    final formatter = DateFormat('MMM d');
    return formatter.format(dateTime);
  }

  static String timeOnly(DateTime dateTime) {
    final formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }

  /// Converts Map<dynamic, dynamic> to Map<String, dynamic> recursively
  static Map<String, dynamic>? convertMapToMapStringDynamic(Map? json) {
    if (json == null) return null;
    if (json.isEmpty) return {};

    Map<String, dynamic> converted = {};
    for (dynamic key in json.keys) {
      if (json[key] is Map? || json[key] is Map) {
        converted[key.toString()] = convertMapToMapStringDynamic(json[key]);
      } else {
        converted[key.toString()] = json[key];
      }
    }
    return converted;
  }
}
