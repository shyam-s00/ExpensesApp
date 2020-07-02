import 'package:flutter/material.dart';

import '../Widgets/summary_tile.dart';
import '../Widgets/transactions_list.dart';
import 'newTransactionPage.dart';

class HomePage extends StatelessWidget {
  static const String ROUTE = '/';

  void _openNewTransactionPage(BuildContext context) {
    Navigator.of(context).pushNamed(NewTransactionPage.ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              height: mediaQuery.size.height * 0.22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [SummaryTile('TODAY'), SummaryTile('THIS WEEK')],
              ),
            ),
            Container(
                height: mediaQuery.size.height * 0.58,
                child: TransactionsList()),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _openNewTransactionPage(context),
            icon: Icon(Icons.add),
            label: const Text('Add New')));
  }
}
