import 'package:expenses/Models/transaction.dart';
import 'package:expenses/Stub/transactions_data.dart';
import 'package:flutter/material.dart';

import '../Widgets/summary_tile.dart';
import '../Widgets/transactions_list.dart';
import 'newTransactionPage.dart';

class HomePage extends StatelessWidget {
  static const String ROUTE = '/';

  void _openNewTransactionPage(BuildContext context) {
    Navigator.of(context).pushNamed(NewTransactionPage.ROUTE);
  }

  final List<TransactionModel> transactions = Stub.transactions;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    transactions.sort((x, y) => y.transactionDate.compareTo(x.transactionDate));

    const tiles = ['Today', 'This Week', 'This Month'];

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
              child:  GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // to disable scrolling :)
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 120,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1),
                 itemBuilder: (c, i) {
                   return SummaryTile(tiles[i]);
                 }, 
                 itemCount: 3,)
              ),
            
            Container(
                height: mediaQuery.size.height * 0.58,
                child: TransactionsList(itemSource: transactions)),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _openNewTransactionPage(context),
            icon: Icon(Icons.add),
            label: const Text('Add New')));
  }
}
