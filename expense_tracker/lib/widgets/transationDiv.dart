import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionDiv extends StatelessWidget {
  final List<Transaction> transactions;
  final int index;
  final Function(String) handleDelete;

  TransactionDiv(this.transactions, this.index, this.handleDelete);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                  child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(1)}'))),
        ),
        title: Text(transactions[index].title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMMMMd().format(transactions[index].date),
            style: TextStyle(color: Colors.grey)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () => handleDelete(transactions[index].id),
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                label: Text(
                  'Delete',
                  style: TextStyle(
                      fontFamily: "QuickSand",
                      color: Theme.of(context).errorColor),
                ))
            : IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                onPressed: () => handleDelete(transactions[index].id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
