import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TransactionDiv extends StatelessWidget {
  final List<Transaction> transactions;
  final int index;

  TransactionDiv(this.transactions, this.index);

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
      ),
    );

    // Card(
    //     child: Row(
    //   children: [
    //     Container(
    //         width: 110,
    //         margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    //         decoration: BoxDecoration(
    //             border: Border.all(color: Colors.purple, width: 1)),
    //         padding: EdgeInsets.all(10),
    //         child: Text('\$${transactions[index].amount.toStringAsFixed(1)}',
    //             style: const TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 20,
    //                 color: Colors.purple))),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(transactions[index].title,
    //             style: Theme.of(context).textTheme.headline6),
    //         Text(DateFormat.yMMMMd().format(transactions[index].date),
    //             style: TextStyle(color: Colors.grey))
    //       ],
    //     )
  }
}
