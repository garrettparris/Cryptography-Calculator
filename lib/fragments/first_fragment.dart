import 'package:flutter/material.dart';
import 'dart:core';
import 'modulo_pages/regular_modulo.dart';
import 'modulo_pages/inverse_modulo.dart';
import 'modulo_pages/exponent_modulo.dart';

class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Modulo'),
              onPressed: () {
                // Navigate to the second screen using a named route

                Navigator.of(context).push(new MaterialPageRoute(builder:
                    (BuildContext context) => new RegularModulo()));
              },
            ),
            RaisedButton(
              child: Text('Inverse Modulo'),
              onPressed: () {
                // Navigate to the second screen using a named route

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new InverseModulo()),
                );
              },
            ),
            RaisedButton(
              child: Text('Exponent modulo'),
              onPressed: () {
                // Navigate to the second screen using a named route

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new ExponentModulo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

