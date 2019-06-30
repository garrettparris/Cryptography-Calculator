import 'package:flutter/material.dart';
import 'dart:core';

class Euclidean extends StatefulWidget{
  _Euclidean createState() => _Euclidean();

}

class _Euclidean extends State<Euclidean> {
  TextEditingController aValue = new TextEditingController();
  TextEditingController nValue = new TextEditingController();
  BigInt result;
  bool visibilityTag = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.00, 30.0, 0.00, 0.0),

                  child: new Container(
                    child: new Text('gcd(a,b)', style: TextStyle(
        fontStyle: FontStyle.italic, fontSize: 20.00),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.00, 10.0, 40.00, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("a: "),
                  new Flexible(
                    child: new TextField(
                      controller: aValue,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        contentPadding: new EdgeInsets.all(0.0),


                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.00, 10.0, 40.00, 0.0),
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
                              contentPadding: new EdgeInsets.all(0.0)),
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
                      visibilityTag = true;
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
            visibilityTag ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: new Text(
                      '${this.result}'),
                ),
              ],

            ) : new Container(),
          ],
        ),
      ),
    );
  }
}

