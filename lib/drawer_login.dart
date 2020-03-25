import 'package:flutter/material.dart';

/* ==================================================
// swipe from left to open 'drawer' for account info
================================================== */

class MyDrawerLogin extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.only(top: 40),children: <Widget>[
        ListTile(
          title: Text('test')
        )
      ],)
    );
  }
}