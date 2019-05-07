import 'package:flutter/material.dart';
import 'dart:core';
import 'gcdPages/euclidean.dart';
import 'gcdPages/extendedEuclidean.dart';


class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Euclidean Algorithm'),
              onPressed: () {
                // Navigate to the second screen using a named route

                Navigator.of(context).push(new MaterialPageRoute(builder:
                    (BuildContext context) => new Euclidean()));
              },
            ),
            RaisedButton(
              child: Text('Extended Euclidean Algorithm'),
              onPressed: () {
                // Navigate to the second screen using a named route

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => new extendedEuclidean()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

