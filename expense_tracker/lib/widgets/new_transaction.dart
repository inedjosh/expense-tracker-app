import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) handleSubmit;

  NewTransaction(this.handleSubmit);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      Navigator.of(context).pop();
      return;
    }

    widget.handleSubmit(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Enter title'),
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Enter amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                Container(
                  height: 90,
                  child: Row(
                    children: [
                      Text('No date chosen'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Choose date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: submitData,
                    child: Text('Add Transaction',
                        style: TextStyle(
                          color: Colors.white,
                        )))
              ],
            ),
          ),
        ));
  }
}
