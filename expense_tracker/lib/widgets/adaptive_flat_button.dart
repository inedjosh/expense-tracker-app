import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback _handler;

  const AdaptiveFlatButton(this.text, this._handler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: _handler,
            child: const Text('Add Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSand',
                    fontSize: 18)))
        : ElevatedButton(
            onPressed: _handler,
            child: const Text('Add Transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSand',
                    fontSize: 18)));
  }
}
