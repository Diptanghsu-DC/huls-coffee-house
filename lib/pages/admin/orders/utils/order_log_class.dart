import 'package:huls_coffee_house/pages/admin/orders/utils/order_log_fields.dart';

class OrderLog {
  final String date;
  final String time;
  final String orderName;
  final num orderQuantity;
  final num totalPrice;
  final String orderCompletedBy;
  final String customerName;
  final String customerPhone;

  const OrderLog({
    required this.date,
    required this.time,
    required this.orderName,
    required this.orderQuantity,
    required this.totalPrice,
    required this.orderCompletedBy,
    required this.customerName,
    required this.customerPhone,
  });

  Map<String, dynamic> toJson() => {
        OrderLogFields.date: date,
        OrderLogFields.time: time,
        OrderLogFields.orderName: orderName,
        OrderLogFields.orderQuantity: orderQuantity,
        OrderLogFields.totalPrice: totalPrice,
        OrderLogFields.orderCompletedBy: orderCompletedBy,
        OrderLogFields.customerName: customerName,
        OrderLogFields.customerPhone: customerPhone,
      };
}
