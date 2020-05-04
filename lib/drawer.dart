

import 'package:cs491/main.dart';
import 'package:flutter/material.dart';

import '_home_page.dart';
import '_user_favorites_page.dart';
import '_user_history_page.dart';
import '_user_preferences_page.dart';
import 'routing_constants.dart';
import 'globals.dart';
import 'single_loggedIn.dart';

/* ==================================================
// swipe from left to open 'drawer' for account info
================================================== */

class MyDrawer extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    var s = singletonLoggedIn;
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
          Text('chris', style: TextStyle(fontSize: 20),)
          ],))),
          
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),

        /*History*/
        Container(
          height: 80,
          child: Card(
            color: Colors.grey[100],
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Center(child: Container(
                child: Row(
                  children: [
                    Icon(Icons.history, size: 40),
                    SizedBox(width: 15),
                    Text('History', style: TextStyle(fontSize: 20),),
                  ])
              )),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new HistoryPageView();
                }));
              },
            ))),
        
        /*Favorites*/
        Container(
          height: 80,
          child: Card(
            color: Colors.grey[100],
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Center(child: Container(
                child: Row(
                  children: [
                    Icon(Icons.favorite, size: 40),
                    SizedBox(width: 15),
                    Text('Favorites', style: TextStyle(fontSize: 20),),
                  ])
              )),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new FavoritesPageView();
                }));
              },
            ))),

        /*Preferences*/
        Container(
          height: 80,
          child: Card(
            color: Colors.grey[100],
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Center(child: Container(
                child: Row(
                  children: [
                    Icon(Icons.phonelink_setup, size: 40),
                    SizedBox(width: 15),
                    Text('Preferences', style: TextStyle(fontSize: 20),),
                  ])
              )),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new PreferencesPageView();
                }));
              },
            ))),
            SizedBox(height: 100),

        /*Log out*/
        Container(
          height: 80,
          child: Card(
            color: Colors.grey[100],
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Center(child: Container(
                child: Row(
                  children: [
                    Icon(Icons.backspace, size: 40),
                    SizedBox(width: 15),
                    Text('Log Out', style: TextStyle(fontSize: 20),),
                  ])
              )),
              onTap: () {
                s.loggedIn = false;
                Navigator.pop(context);
                // (context as Element).reassemble();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return new MyApp();
                }));
              },
            ))),
       
    ]));
  }
}