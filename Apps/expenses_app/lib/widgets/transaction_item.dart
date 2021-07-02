import 'dart:math';

import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionItem(Key key, this.transaction, this.deleteTransaction)
      : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const colors = [
      Colors.black,
      Colors.red,
      Colors.amber,
      Colors.blue,
    ];
    _bgColor = colors[Random.secure().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                  child: Text(
                "\$${widget.transaction.amount.toStringAsFixed(2)}",
              )),
            ),
          ),
          title: Text(
            widget.transaction.title,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            DateFormat.yMMMEd().format(widget.transaction.time),
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () =>
                      widget.deleteTransaction(widget.transaction.id),
                  label: Text("Delete"),
                  color: Theme.of(context).primaryColor,
                  icon: Icon(Icons.delete),
                )
              : IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () =>
                      widget.deleteTransaction(widget.transaction.id),
                ),
        ),
      ),
    );
  }
}
