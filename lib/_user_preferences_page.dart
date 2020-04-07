import 'package:flutter/material.dart';

class PreferencesPageView extends StatelessWidget {
  const PreferencesPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Preferences Page')
        ,),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },),
        
      ),

    );

  }
}