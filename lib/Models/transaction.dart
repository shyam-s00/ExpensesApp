import 'package:flutter/foundation.dart';

enum ProductCategory {
  Grocery,
  FoodAndBreverage,
  Apparel,
  Mobile,
  Electornics,
  HouseHold,
  Kitchen,
  ComputerAccessories

}

class TransactionModel {
  int id;
  String productName;
  DateTime transactionDate;
  double price;
  ProductCategory category;

  TransactionModel(
      {@required this.id,
      @required this.productName,
      @required this.price,
      @required this.transactionDate,
      this.category});
}
