import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double, DateTime) handleSubmit;

  NewTransaction(this.handleSubmit);

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

    final _enteredTitle = titleController.text;
    final _enteredAmount = double.parse(amountController.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.handleSubmit(_enteredTitle, _enteredAmount, _selectedDate);

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
                  style: TextStyle(fontFamily: 'QuickSand'),
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Enter amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                  style: TextStyle(fontFamily: 'QuickSand'),
                ),
                Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No date chosen'
                            : "Picked Date: ${DateFormat.yMd().format(_selectedDate)}",
                        style: TextStyle(fontFamily: 'QuickSand'),
                      ),
                      TextButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            'Choose date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'QuickSand'),
                          ))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: _submitData,
                    child: Text('Add Transaction',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'QuickSand',
                            fontSize: 18)))
              ],
            ),
          ),
        ));
  }
}
