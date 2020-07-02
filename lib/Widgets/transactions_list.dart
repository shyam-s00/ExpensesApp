import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (c, i) {
          return Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                width: 60,
                height: 30,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                    color: Theme.of(c).accentColor),
                child: Center(child: Text('\$${(2 * i).toString()}')),
              ),
              title: Text('Item $i'),
              subtitle: Text(DateTime.now().toIso8601String()),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}
