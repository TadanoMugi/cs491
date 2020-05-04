import 'package:flutter/material.dart';

import 'routing_constants.dart';

// import 'routing_constants.dart';

class RegisterPageView extends StatelessWidget {
  RegisterPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget simpleButton(String str, String route) {
      return FlatButton(
        child: Text(str, style: TextStyle(fontSize: 16,color: Colors.blue[700])),
        onPressed: () {Navigator.pushNamed(context, route);},
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Create New Account')),
        body: ListView(
          children: <Widget>[
            /*login text*/
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text('               Create a new account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700))
              ),
            /*email text field*/
            Container(
                padding: const EdgeInsets.only(top: 30, right: 40, left: 40, bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email'
                  ),
                )
              ),
              /*username text field*/
              Container(
                padding: const EdgeInsets.only(right: 40, left: 40, bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Username'
                  ),
                )
              ),
              /*password text field*/
              Container(
                padding: const EdgeInsets.only(right: 40, left: 40, bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password'
                  ),
                  obscureText: true,
                )
              ),
              /*password confirm text field*/
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password'
                  ),
                  obscureText: true,
                )
              ),
              Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                simpleButton('Sign in instead',LoginPageRoute),
                SizedBox(width: 120),
                Container(
                  // padding: const EdgeInsets.only(right: 20),
                  child: RaisedButton(
                    child: Text('Next',),
                    onPressed: () {
                      /*logic for checking account?*/
                      Navigator.pushNamed(context, HomePageRoute);
                    },
                  )
                )
              ],),)
          ]
        )
      )
    );
  }
}