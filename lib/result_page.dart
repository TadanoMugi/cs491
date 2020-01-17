import 'package:flutter/material.dart';

class ResultPageView extends StatelessWidget {
  const ResultPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      },),
      body: Center(
        child: Text('Result Page'),
      ),
    );
  }
}