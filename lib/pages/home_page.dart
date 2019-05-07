import 'package:cryptography_calculator/fragments/first_fragment.dart';
import 'package:cryptography_calculator/fragments/second_fragment.dart';
import 'package:cryptography_calculator/fragments/third_fragment.dart';
import 'package:cryptography_calculator/fragments/fourth_fragment.dart';

import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  String name;
  DrawerItem(this.title, this.name);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Modulo Calculator", "Modulo Calculator"),
    new DrawerItem("Greatest Common Denominator", "Greatest Common Denominator"),
    new DrawerItem("Greatest Common Denominator","Greatest Common Denominator"),
    new DrawerItem("SHA-3","SHA-3"),
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
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();
      case 3:
        return new FourthFragment();

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