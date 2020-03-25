import 'package:flutter/material.dart';

class PreferencesPageView extends StatelessWidget {
  const PreferencesPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Preferences Page')
        ,)
          
      )
    );

  }
}