class OrderLogFields {
  static const String date = 'Date';
  static const String time = 'Time';
  static const String orderName = 'Order_name';
  static const String orderQuantity = 'Order_quantity';
  static const String totalPrice = 'Total_price';
  static const String orderCompletedBy = 'Order_completed_by';
  static const String customerName = 'Customer Name';
  static const String customerPhone = 'Customer Phone';

  static List<String> getFields() => [
        date,
        time,
        orderName,
        orderQuantity,
        totalPrice,
        orderCompletedBy,
        customerName,
        customerPhone
      ];
}
