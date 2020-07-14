// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return TransactionModel(
    id: json['id'] as int,
    productName: json['productName'] as String,
    price: (json['price'] as num).toDouble(),
    transactionDate: DateTime.parse(json['transactionDate'] as String),
    category: _$enumDecode(_$ProductCategoryEnumMap, json['category']),
  );
}

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'price': instance.price,
      'category': _$ProductCategoryEnumMap[instance.category],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$ProductCategoryEnumMap = {
  ProductCategory.Grocery: 'Grocery',
  ProductCategory.FoodAndBreverage: 'FoodAndBreverage',
  ProductCategory.Apparel: 'Apparel',
  ProductCategory.Mobile: 'Mobile',
  ProductCategory.Electornics: 'Electornics',
  ProductCategory.HouseHold: 'HouseHold',
  ProductCategory.Kitchen: 'Kitchen',
  ProductCategory.ComputerAccessories: 'ComputerAccessories',
};
