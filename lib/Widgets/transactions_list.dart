import 'package:expenses/Blocs/load_transactions_bloc.dart';
import 'package:expenses/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  //final List<TransactionModel> itemSource;
  final double heightPct;
  TransactionsList({this.heightPct = 1.0});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return BlocBuilder<LoadTransactionsBloc, TransactionsState>(
      bloc: BlocProvider.of<LoadTransactionsBloc>(context),
      builder: (ctx, state) {
        if (state is TransactionsLoading) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is TransactionsError) {
          return Center(
            child: Text(state.errorMsg),
          );
        }
        if (state is TransactionsLoaded) {
          return Container(
            height: mediaQuery.size.height * heightPct,
            child: ListView.builder(
              itemBuilder: (c, i) {
                var _item = state.transactions[i];
                return TransactionItem(key: ValueKey(_item.id), model: _item);
              },
              itemCount: state.transactions.length,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text('Transactions Not Loaded'),
            ),
          );
        }
      },
    );

    // return Container(
    //   height: mediaQuery.size.height * heightPct,
    //   child: ListView.builder(
    //     itemBuilder: (c, i) {
    //       var _item = itemSource[i];
    //       return TransactionItem(key: ValueKey(_item.id), model: _item);
    //     },
    //     itemCount: itemSource.length,
    //   ),
    // );
  }
}

class TransactionItem extends StatelessWidget {
  final TransactionModel model;

  const TransactionItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Container(
          width: 60,
          height: 30,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, style: BorderStyle.solid),
              shape: BoxShape.rectangle,
              color: Theme.of(context).accentColor),
          child: FittedBox(
              fit: BoxFit.contain,
              child: Center(child: Text('${model.price.toString()}'))),
        ),
        title: Text(model.productName),
        subtitle: Text(DateFormat.yMMMd().format(model.transactionDate)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
