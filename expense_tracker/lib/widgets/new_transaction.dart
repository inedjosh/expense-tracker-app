import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) handleSubmit;

  const NewTransaction(this.handleSubmit, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  dynamic _selectedDate;

  void _submitData() {
    if (amountController.text == '') {
      return;
    }

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.handleSubmit(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Enter title'),
                    style: const TextStyle(fontFamily: 'QuickSand'),
                    controller: titleController,
                    keyboardType: TextInputType.name,
                    onSubmitted: (_) => _submitData(),
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Enter amount'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => _submitData(),
                    style: const TextStyle(fontFamily: 'QuickSand'),
                  ),
                  SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No date chosen'
                              : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}",
                          style: const TextStyle(fontFamily: 'QuickSand'),
                        ),
                        TextButton(
                            onPressed: _presentDatePicker,
                            child: const Text(
                              'Choose date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'QuickSand'),
                            ))
                      ],
                    ),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          onPressed: _submitData,
                          child: const Text('Add Transaction',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'QuickSand',
                                  fontSize: 18)))
                      : ElevatedButton(
                          onPressed: _submitData,
                          child: const Text('Add Transaction',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'QuickSand',
                                  fontSize: 18)))
                ],
              ),
            ),
          )),
    );
  }
}
