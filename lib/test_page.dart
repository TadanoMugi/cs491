import 'package:flutter/material.dart';

class TestPageView extends StatelessWidget {
  const TestPageView({Key key}) : super(key: key);

/* ==================================================
// this page is strictly for testing things
// page is now weeb approved
================================================== */

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(Icons.keyboard_backspace),
        onPressed: () {
        Navigator.pop(context);
      },),
      body: Center(
        child: Container(padding: const EdgeInsets.only(top: 200),
        child: Column(children: <Widget>[
          Text('UNDER CONSTRUCTION', style: TextStyle(fontSize: 25)),
          SizedBox(height: 20),
          // *WARNING: weeb gif
          Image.asset(
            'images/under_construction.gif',
            height: 200,
            width: 200,
          ),
          Text('uwu'),
        ],))

      ),
    );
  }
}