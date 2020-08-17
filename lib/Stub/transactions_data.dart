import '../Models/transaction.dart';

class Stub {
  static List<TransactionModel> transactions = [
    TransactionModel(id: 001, productName: "T-Shirt", transactionDate: DateTime(2020, 05, 01), price: 2399, category: ProductCategory.Apparel),
    TransactionModel(id: 002, productName: "Brand x Sneakers", transactionDate: DateTime(2020, 6, 4), price: 1799, category: ProductCategory.Apparel),
    TransactionModel(id: 003, productName: "NVMe SSD", transactionDate: DateTime(2020, 06, 30), price: 10999, category: ProductCategory.ComputerAccessories),
    TransactionModel(id: 004, productName: "Cheddar Cheese", transactionDate: DateTime(2020, 07, 03), price: 150, category: ProductCategory.FoodAndBreverage),
    TransactionModel(id: 005, productName: "Chocolate Milk", transactionDate: DateTime(2020, 05, 22), price: 20, category: ProductCategory.FoodAndBreverage),
    TransactionModel(id: 006, productName: "Vegetables", transactionDate: DateTime(2020, 07, 03), price: 224, category: ProductCategory.Grocery),

  ];
}
