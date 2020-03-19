import 'package:flutter/material.dart';

/* ==================================================
// swipe from left to open 'drawer' for account info
================================================== */

class MyDrawer extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.only(top: 40),children: <Widget>[

        /*profile picture and username*/
        ListTile(title: Container(child: Column(children: <Widget>[
          Image.asset(
            'images/profile_default.png',
            width: 150, height: 150,
            fit: BoxFit.none,
          ),
          SizedBox(height: 10),
          Text('*username*')
          ],))),
          
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),

        /*History*/
        ListTile(
          title: Text('*History*'),
          onTap: () {},
        ),
        SizedBox(height: 10),
        
        /*Saved Recipes*/
        ListTile(
          title: Text('*Saved Recipes*'),
          onTap: () {},
        ),
        SizedBox(height: 10),

        /*Preferences*/
        ListTile(
          title: Text('*Preferences*'),
          onTap: () {},
        ),
        SizedBox(height: 150),

        /*Log out*/
        ListTile(
          title: Text('*Log Out*'),
          onTap: () {},
        )
      ],)
    );
  }
}