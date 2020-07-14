import 'package:expenses/Blocs/load_transactions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/summary_tile.dart';
import '../Widgets/transactions_list.dart';

class TransactionSummaryWidget extends StatelessWidget {
  final double heightPct;

  TransactionSummaryWidget({this.heightPct = 1.0});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    const tiles = ['Today', 'This Week', 'This Month'];

    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      height: mediaQuery.size.height * heightPct,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1),
        itemBuilder: (_, idx) => SummaryTile(tiles[idx]),
        itemCount: tiles.length,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static const String ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    final LoadTransactionsBloc bloc =
        BlocProvider.of<LoadTransactionsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
      ),
      body: Column(
        children: <Widget>[
          TransactionSummaryWidget(
            heightPct: 0.22,
          ),
          TransactionsList(
            heightPct: 0.58,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {bloc.add(LoadTransactions())},
          icon: Icon(Icons.refresh),
          label: const Text('Refresh')),
    );
  }
}
