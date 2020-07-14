import 'package:flutter/foundation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

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

@JsonSerializable(nullable: false)
class TransactionModel {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'product_name')
  String productName;

  @JsonKey(name: 'transaction_date')
  DateTime transactionDate;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'category')
  ProductCategory category;

  TransactionModel(
      {@required this.id,
      @required this.productName,
      @required this.price,
      @required this.transactionDate,
      this.category});

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this); 
}
