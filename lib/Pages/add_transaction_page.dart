import 'dart:math';

import 'package:expenses/Models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionPage extends StatefulWidget {
  static const ROUTE = '/new_transaction';

  @override
  _NewTransactionPageState createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends State<NewTransactionPage> {
  final _productController = TextEditingController();
  final _priceController = TextEditingController();

  String _selectedDate = 'Pick a Date';

  DateTime _dateTime;

  ProductCategory _selectedCategory;

  void _pickDate() async {
    _dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          Duration(days: 30),
        ),
        lastDate: DateTime.now());
    setState(() {
      _selectedDate =
          _dateTime == null ? 'Pick a Date' : DateFormat.yMMMd().format(_dateTime);
    });
  }

  void _onSelectedCategory(ProductCategory category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _createTransaction() {
    var _transaction = TransactionModel(
      id: Random(19).nextInt(100000),
      price: double.parse(_priceController.text),
      productName: _productController.text,
      transactionDate: _dateTime,
      category: _selectedCategory
    );

    // for now just return the added transaction as nav param
    Navigator.of(context).pop<TransactionModel>(_transaction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Transaction'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  hintText: 'Enter the name of the Product',
                ),
                controller: _productController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: 'Enter the price of the Product',
                ),
                controller: _priceController,
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                child: InkWell(
                  child: Row(
                    children: [
                      Text(_selectedDate),
                      Spacer(),
                      Icon(Icons.date_range),
                    ],
                  ),
                  onTap: _pickDate,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButton<ProductCategory>(
                    value: _selectedCategory,
                    hint: Text('Choose a Category'),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 18,
                    items: ProductCategory.values
                        .map<DropdownMenuItem<ProductCategory>>((category) {
                      return DropdownMenuItem<ProductCategory>(
                        value: category,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(describeEnum(category)),
                        ),
                      );
                    }).toList(),
                    onChanged: _onSelectedCategory),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('Save'),
                  onPressed: _createTransaction,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
