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

  ProductCategory _selectedCategory;

  void _pickDate() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          Duration(days: 30),
        ),
        lastDate: DateTime.now());
    setState(() {
      _selectedDate = date == null ? 'Pick a Date' : DateFormat.yMMMd().format(date);
    });
  }

  void _onSelectedCategory(ProductCategory category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Transaction'),
      ),
      body: Padding(
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
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
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

            DropdownButton<ProductCategory>(
                    value: _selectedCategory,
                    hint: Text('Choose a Category'),
                    isExpanded: false,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 18,
                    items: ProductCategory.values.map<DropdownMenuItem<ProductCategory>>((category)  {
                      return DropdownMenuItem<ProductCategory>(value: category, child: Text(category.toString()),);
                    }).toList(),
                    onChanged: _onSelectedCategory
                  ),
          ],
        ),
      ),
    );
  }
}
