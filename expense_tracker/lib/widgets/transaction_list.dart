import 'package:expense_tracker/widgets/transationDiv.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) handleDelete;

  TransactionList(this.transactions, this.handleDelete);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text('No Transaction added yet',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    margin: EdgeInsets.all(20),
                    child: Image.asset('assets/image/waiting.png',
                        fit: BoxFit.cover),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionDiv(transactions, index, handleDelete);
                },
                itemCount: transactions.length,
              ));
  }
}
