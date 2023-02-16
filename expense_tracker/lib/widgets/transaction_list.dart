import 'package:expense_tracker/widgets/transation_div.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) handleDelete;

  const TransactionList(this.transactions, this.handleDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constarints) {
                return Column(
                  children: [
                    Text('No Transaction added yet',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constarints.maxHeight * 0.4,
                      width: 100,
                      margin: const EdgeInsets.all(20),
                      child: Image.asset('assets/image/waiting.png',
                          fit: BoxFit.cover),
                    )
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionDiv(transactions, index, handleDelete);
                },
                itemCount: transactions.length,
              ));
  }
}
