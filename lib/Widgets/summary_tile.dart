import 'package:expenses/Pages/transactions_page.dart';
import 'package:flutter/material.dart';

class SummaryTile extends StatelessWidget {
  final String title;

  SummaryTile(this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(TransactionsPage.ROUTE),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(5), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Theme.of(context).accentColor.withOpacity(0.8),
            Theme.of(context).accentColor
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Center(child: Text(title, style: TextStyle(fontSize: 22))),        
      ),
    );
  }
}
