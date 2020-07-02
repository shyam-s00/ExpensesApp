import 'package:flutter/material.dart';

class NewTransactionPage extends StatelessWidget {
  static const ROUTE = '/new_transaction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Transaction'),
      ),
      body: Center(
        child: const Text('Add new transaction form comes here'),
      ),
    );
  }
}
