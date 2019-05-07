import 'package:flutter/material.dart';
import 'dart:core';

class Euclidean extends StatefulWidget{
  _Euclidean createState() => _Euclidean();

}

class _Euclidean extends State<Euclidean> {
  TextEditingController aValue = new TextEditingController();
  TextEditingController nValue = new TextEditingController();
  BigInt result;

  @override
  Widget build(BuildContext context) {
    var assetimg = new AssetImage("assets/modulo.png");
    var image = new Image(
      image: assetimg,
      height: 100.00,
      width: 100.00,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Euclidean Algorithm"),
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
                      hintText: "a", contentPadding: new EdgeInsets.all(0.0),


                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("b: "),
                    new Flexible(
                      child: new TextField(
                        controller: nValue,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            hintText: "b", contentPadding: new EdgeInsets.all(0.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Calculate'),
                  elevation: 4.0,
                  color: Colors.blue,
                  onPressed: (){
                    setState(() {
                      this.result= (BigInt.parse(aValue.text.toString()).gcd(BigInt.parse(nValue.text.toString())));
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
                  child: new Text(
                      '${this.result}'),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}

