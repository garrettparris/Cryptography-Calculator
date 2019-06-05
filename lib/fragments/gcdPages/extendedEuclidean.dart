import 'package:flutter/material.dart';
import 'dart:core';
var xValue;
var yValue;
class extendedEuclidean extends StatefulWidget {
  _extendedEuclidean createState() => _extendedEuclidean();
}

class _extendedEuclidean extends State<extendedEuclidean> {
  TextEditingController aValue = new TextEditingController();
  TextEditingController nValue = new TextEditingController();
  List<BigInt> result= new List(2);
  BigInt a,b,gcd;
  bool visibilityTag = false;
  @override
  Widget build(BuildContext context) {
    var assetimg = new AssetImage("assets/modulo.png");
    var image = new Image(
      image: assetimg,
      height: 100.00,
      width: 100.00,
    );
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
                    child: new Text('a*x + b*y = gcd(a,b)', style: TextStyle(
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
                  onPressed: () {
                    setState(() {
                      this.a=BigInt.parse(aValue.text.toString());
                      this.b=BigInt.parse(nValue.text.toString());
                      this.gcd=a.gcd(b);
                      this.result = bezoutIdentity(a,b);
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
                  child: new Text('x : ${this.result[0]}'),
                ),
              ],
            ) : new Container(),
            visibilityTag ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: new Text('y : ${this.result[1]}'),
                ),
              ],
            ) : new Container(),
            visibilityTag ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Flexible(
                  child: new Text('gcd : ${this.gcd}'),
                ),
              ],
            ) : new Container(),
          ],
        ),
      ),
    );
  }
}

bezoutIdentity(BigInt a, BigInt b) {
  List<BigInt> result=new List(2);
  var x=BigInt.zero;
  var y=BigInt.one;
  var last_x=BigInt.one;
  var last_y=BigInt.zero;
  var temp,q,r;
  while(b!=BigInt.zero){
    q=a~/b;
    r=a%b;
    a=b;
    b=r;
    temp=x;
    x=last_x-q*x;
    last_x=temp;
    temp=y;
    y=last_y-q*y;
    last_y=temp;
  }
  result[0]=last_x;
  result[1]=last_y;
  return result;
}