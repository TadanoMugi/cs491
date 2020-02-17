import 'package:flutter/material.dart';

class TestPageView extends StatelessWidget {
  const TestPageView({Key key}) : super(key: key);

/* ==================================================
// this page is strictly for testing things
================================================== */

  @override
  Widget build(BuildContext context) {

    String outputText = 'helloworld';

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(Icons.keyboard_backspace),
        onPressed: () {
        Navigator.pop(context);
      },),
      body: Center(
/* ==================================================
// @Marc: text in here will be viewed in the middle
    of the page
================================================== */
        child: Text(outputText),
      ),
    );
  }
}