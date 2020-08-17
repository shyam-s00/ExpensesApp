import 'package:expenses/Blocs/load_transactions_bloc.dart';
import 'package:expenses/Widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsPage extends StatefulWidget {
  static const ROUTE = '/transactions_list';

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {

  LoadTransactionsBloc _bloc; 

  @override
  void initState() {
    _bloc = BlocProvider.of<LoadTransactionsBloc>(context); 
    super.initState();
  }


  @override
  void didChangeDependencies() {
    _bloc.add(LoadTransactions());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
      ),
      body: Container(
        child: TransactionsList(),
      )
    );
  }
}