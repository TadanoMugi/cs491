import 'package:flutter/material.dart';

import '_login_page.dart';

/* ==================================================
// swipe from left to open 'drawer' for account info
================================================== */

class MyDrawerLogin extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.only(top: 40),children: <Widget>[
        
        ListTile(title: Container(child: Column(children: <Widget>[
          SizedBox(height: 200),
          Text('Log in to view more options', style: TextStyle(fontSize: 20),),
          SizedBox(height: 80)
        ],),)),

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
                  Icon(Icons.input, size: 40),
                  SizedBox(width: 15),
                  Text('Log In', style: TextStyle(fontSize: 20),),
                ])
            )),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return new LoginPageView();
              }));
            }
            )
          )
        )
      
      ],)
    );
  }
}