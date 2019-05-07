import 'package:flutter/material.dart';
import 'dart:core';

class extendedEuclidean extends StatefulWidget {
  _extendedEuclidean createState() => _extendedEuclidean();
}

class _extendedEuclidean extends State<extendedEuclidean> {
  TextEditingController aValue = new TextEditingController();
  TextEditingController nValue = new TextEditingController();
  List<BigInt> result= new List<BigInt>(5);

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
        title: Text("Extended Euclidean Algorithm"),
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
                            hintText: "b",
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

                      this.result = extEuc(BigInt.parse(aValue.text.toString()), BigInt.parse(nValue.text.toString()), BigInt.one, BigInt.one);



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
                  child: new Text('${this.result[1]} + ${this.result[2]} = ${this.result[3]}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extEuc(BigInt a, BigInt b, BigInt x, BigInt y){
  List<BigInt> result= new List<BigInt>(4);
  //Base Case
  if(a==BigInt.zero){
    x=BigInt.zero;
    y=BigInt.one;
    return b;
  }
  var  x1=BigInt.one;
  var  y1=BigInt.one;
  var gcd=extEuc(b%a as BigInt,a,x1,y1) as BigInt;


  x=y1-((b/a) as BigInt)*x1;
  y=x1;
  result[1]=x;
  result[2]=y;
  result[3]=gcd;
  return result;


}
