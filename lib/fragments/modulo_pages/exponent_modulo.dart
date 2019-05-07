import 'package:flutter/material.dart';
import 'dart:core';
class ExponentModulo extends StatefulWidget {
  _ExponentModulo createState() => _ExponentModulo();
}

class _ExponentModulo extends State<ExponentModulo> {
  TextEditingController aValue = new TextEditingController();
  TextEditingController nValue = new TextEditingController();
  TextEditingController xValue = new TextEditingController();

  int result;

  @override
  Widget build(BuildContext context) {
    var assetimg = new AssetImage("assets/Exponentmod.png");
    var image = new Image(
      image: assetimg,
      height: 100.00,
      width: 100.00,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Modulo"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: image,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("a: "),
                new Flexible(
                  child: new TextField(
                    controller: aValue,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      hintText: "a",
                      contentPadding: new EdgeInsets.all(0.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("x: "),
                new Flexible(
                  child: new TextField(
                    controller: xValue,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      hintText: "x",
                      contentPadding: new EdgeInsets.all(0.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("n: "),
                new Flexible(
                  child: new TextField(
                    controller: nValue,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        hintText: "n", contentPadding: new EdgeInsets.all(0.0)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Calculate'),
                  elevation: 4.0,
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      this.result = modPow(
                          BigInt.parse(aValue.text.toString()),
                          BigInt.parse(xValue.text.toString()),
                          BigInt.parse(nValue.text.toString()));
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Result: "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: new Text('${this.result}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

modPow(BigInt b, BigInt e, BigInt m) {
  if (e < BigInt.one) {
    return BigInt.one;
  }
  if (b < BigInt.zero || b > m) {
    b = b % m;
  }
  var r = BigInt.one;
  while (e > BigInt.zero) {
    if ((e & BigInt.one) > BigInt.zero) {
      r = (r * b) % m;
    }
    e >>= 1;
    b = (b * b) % m;
  }
  return r;
}