// may the force be with you
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

// this is for the text under the logo
    Widget titleSection = Container( 
      // padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Text(
                    'Recipe Finder',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

// these will link to different pages
    Widget buttonSection = Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.deepOrangeAccent, Icons.whatshot, 'CREATE'),
          _buildButtonColumn(Colors.teal, Icons.map, 'LOCATE'),
          _buildButtonColumn(Colors.brown, Icons.directions_car, 'DELIVER'),
        ],
      ),
    );

// this is for account registration/login
    Widget accountSection = Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtonColumn(color, Icons.account_box, 'ACCOUNT'),
        ],
       ),
    );

    return MaterialApp(
      title: 'cs491 Recipe Finder',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipe Finder'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: [
            Image.asset(
              'images/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.none,
            ),
            titleSection,
            buttonSection,
            accountSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 50),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900, 
              color: color,
            ),
          ),
        ),
      ],
    );
  }

}