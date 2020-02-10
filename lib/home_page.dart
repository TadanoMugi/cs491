import 'package:cs491/routing_constants.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

/* ==================================================
// a function that is used to create the raised buttons
================================================== */
    RaisedButton _buildButtonColumn(Color color, IconData icon, String label, String route) {
      return RaisedButton(
        color: Colors.grey[100],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(icon, color: color, size: 40,),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
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
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      );
    }

/* ==================================================
// this is for the text under the logo
================================================== */
    Widget titleSection = Container( 
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
                      fontSize: 30,
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

/* ==================================================
// these will link to different pages
================================================== */
    Widget buttonSection = Container(
      
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.deepOrange[500], Icons.whatshot, 'CREATE', SearchPageRoute),
          _buildButtonColumn(Colors.teal[400], Icons.map, 'LOCATE', 'to_be_implemented'),
          _buildButtonColumn(Colors.brown, Icons.directions_car, 'DELIVER', TestPageRoute),
        ],
      ),
    );

/* ==================================================
// this is for account registration/login
================================================== */
    Widget accountSection = Container(
      padding: const EdgeInsets.only(top: 150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            // color: Colors.grey[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Icon(Icons.account_box, color: color, size: 40,),
                // ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'ACCOUNT',
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900, 
                    color: color,
                    ),
                  ),
                ),
              ]
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'to_be_implemented');
            }
          ),
          // _buildButtonColumn(color, Icons.account_box, 'ACCOUNT', 'to_be_implemented'),
        ],
       ),
    );

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Recipe Finder'),
        // ),
        body: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: [
            // This is where the columns are ordered
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
  } // Widget build

} // class HomePageView