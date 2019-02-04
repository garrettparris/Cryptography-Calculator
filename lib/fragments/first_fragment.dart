import 'package:flutter/material.dart';
import 'dart:core';

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(labelText: "Enter your number"),
                keyboardType: TextInputType.number,
              ),
            ],
          )),
    );
  }

  modulo(int exponent, int dividend, int divisor) {
    if (exponent == 1) {
      return dividend % divisor;
    } else if (exponent == -1) {
      return dividend.modInverse(divisor);
    } else if (!exponent.isNegative && exponent != 1) {
      return dividend.modPow(exponent, divisor);
    } else {
      //broke
    }
  }
}
