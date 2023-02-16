import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionDiv extends StatelessWidget {
  final List<Transaction> transactions;
  final int index;
  final Function(String) handleDelete;

  const TransactionDiv(this.transactions, this.index, this.handleDelete,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                  child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(1)}'))),
        ),
        title: Text(transactions[index].title,
            style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(DateFormat.yMMMMd().format(transactions[index].date),
            style: const TextStyle(color: Colors.grey)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () => handleDelete(transactions[index].id),
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.error),
                label: Text(
                  'Delete',
                  style: TextStyle(
                      fontFamily: "QuickSand",
                      color: Theme.of(context).colorScheme.error),
                ))
            : IconButton(
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.error),
                onPressed: () => handleDelete(transactions[index].id),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
