import 'package:flutter/material.dart';

import 'Pages/homePage.dart';
import 'Pages/newTransactionPage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyExpenses',
      routes: {
        HomePage.ROUTE: (_) => HomePage(),
        NewTransactionPage.ROUTE: (_) => NewTransactionPage(),
      },
    );
  }
}
