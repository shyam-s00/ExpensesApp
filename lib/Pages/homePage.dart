import 'package:expenses/Pages/newTransactionPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String ROUTE = '/';

  void _openNewTransactionPage(BuildContext context) {
    Navigator.of(context).pushNamed(NewTransactionPage.ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
        ),
        body: const Center(
          child: Text('Expenses App Content'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _openNewTransactionPage(context),
            icon: Icon(Icons.add),
            label: const Text('Add New')));
  }
}
