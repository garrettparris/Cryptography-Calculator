import 'package:flutter/material.dart';
import 'dart:core';

class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  width:50,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        hintText: "y", contentPadding: new EdgeInsets.all(0.0)),
                  ),
                ),
                new Container(
                  width: 50,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        hintText: "y", contentPadding: new EdgeInsets.all(0.0)),
                  ),
                ),
                new Container(
                  width: 50,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        hintText: "y", contentPadding: new EdgeInsets.all(0.0)),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(),
              ],
            ),
          ],
        ),
      ),
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
