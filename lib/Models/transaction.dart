import 'package:flutter/foundation.dart';

class TransactionModel {
  int id;
  String productName;
  DateTime transactionDate;
  double price;
  String category;

  TransactionModel(
      {@required this.id,
      @required this.productName,
      @required this.price,
      @required this.transactionDate,
      this.category});
}
