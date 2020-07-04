import 'package:expenses/Models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {

  final List<TransactionModel> itemSource;
  TransactionsList({@required this.itemSource});

 @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (c, i) {
          var _item = itemSource[i];
          return TransactionItem(key: ValueKey(_item.id), model: _item);
        },
        itemCount: itemSource.length,
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {

  final TransactionModel model;

  const TransactionItem({
    Key key,
    this.model
  }) : super(key: key);

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
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid),
              shape: BoxShape.rectangle,
              color: Theme.of(context).accentColor),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Center(child: Text('${model.price.toString()}'))),
        ),
        title: Text(model.productName),
        subtitle: Text(model.transactionDate.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}


