import 'package:expenses/Blocs/load_transactions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/home_page.dart';
import 'Pages/add_transaction_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => LoadTransactionsBloc(TransactionsNotLoaded()),
      child: MaterialApp(
        title: 'MyExpenses',
        routes: {
          HomePage.ROUTE: (_) => HomePage(),
          NewTransactionPage.ROUTE: (_) => NewTransactionPage(),
        },
      ),
    );
  }
}
