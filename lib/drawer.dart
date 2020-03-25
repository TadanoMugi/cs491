import 'package:cs491/routing_constants.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

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
          title: Container(
            child: Row(
              children: [
                Icon(Icons.history),
                Text('*History*'),
              ])
          ),
          onTap: () {Navigator.pushNamed(context, HistoryPageRoute);},
        ),
        SizedBox(height: 10),
        
        /*Saved Recipes*/
        ListTile(
          title: Container(
            child: Row(
              children: [
                Icon(Icons.favorite),
                Text('*Favorites*'),
              ])
          ),
          onTap: () {Navigator.pushNamed(context, FavoritesPageRoute);},
        ),
        SizedBox(height: 10),

        /*Preferences*/
        ListTile(
          title: Container(
            child: Row(
              children: [
                Icon(Icons.phonelink_setup),
                Text('*Preferences*'),
              ])
          ),
          onTap: () {Navigator.pushNamed(context, PreferencesPageRoute);},
        ),
        SizedBox(height: 150),

        /*Log out*/
        ListTile(
          title: Container(
            child: Row(
              children: [
                Icon(Icons.backspace),
                Text('*Preferences*'),
              ])
          ),
          onTap: () {
            loggedIn = false;
            Navigator.pop(context);
          },
        )
      ],)
    );
  }
}