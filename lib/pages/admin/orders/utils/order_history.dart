import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gsheets/gsheets.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/order_log_fields.dart';
import 'package:huls_coffee_house/pages/admin/orders/utils/spreadsheet_credentials.dart';
import 'package:huls_coffee_house/utils/database/constants.dart';

class LogOrder {
  static final _gsheets = GSheets(spreadsheetCredentials);
  static Worksheet? _orderSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets
          .spreadsheet(dotenv.env[EnvValues.ORDER_SPREADSHEET_ID.name]!);
      _orderSheet = await _getWorksheet(spreadsheet, title: 'Order History');

      final firstRow = OrderLogFields.getFields();
      _orderSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      throw Exception("Could not initialize sheet. Please contact developers");
    }
  }

  static Future<Worksheet> _getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return await spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<void> log(Map<String, dynamic> rowList) async {
    if (_orderSheet == null) {
      return;
    }
    await _orderSheet!.values.map.appendRow(rowList);
  }
}
