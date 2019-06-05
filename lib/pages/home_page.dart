import 'package:cryptography_calculator/fragments/modulo_pages/regular_modulo.dart';
import 'package:cryptography_calculator/fragments/modulo_pages/inverse_modulo.dart';
import 'package:cryptography_calculator/fragments/modulo_pages/exponent_modulo.dart';
import 'package:cryptography_calculator/fragments/gcdPages/euclidean.dart';
import 'package:cryptography_calculator/fragments/gcdPages/extendedEuclidean.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  String name;
  DrawerItem(this.title, this.name);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Modulo Calculator", "Modulo Calculator"),
    new DrawerItem("Inverse Modulo Calculator", "Inverse Modulo Calculator"),
    new DrawerItem("Exponential Modulo Calculator", "Exponential Modulo Calculator"),
    new DrawerItem("Greatest Common Denominator", "Greatest Common Denominator"),
    new DrawerItem("Bézout's identity","Bézout's identity"),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new RegularModulo();
      case 1:
        return new InverseModulo();
      case 2:
        return new ExponentModulo();
      case 3:
        return new Euclidean();
      case 4:
        return new extendedEuclidean();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            title: new Text(d.name),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Cryptography Calculator"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}