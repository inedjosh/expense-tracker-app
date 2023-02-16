import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback _handler;

  AdaptiveFlatButton(this.text, this._handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text('Add Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSand',
                    fontSize: 18)),
            onPressed: _handler)
        : ElevatedButton(
            onPressed: _handler,
            child: Text('Add Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSand',
                    fontSize: 18)));
  }
}
