import 'package:flutter/material.dart';

import 'main.dart';
import 'routing_constants.dart';
import 'single_loggedIn.dart';

class LoginPageView extends StatelessWidget {
  LoginPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var s = singletonLoggedIn;

    Widget simpleButton(String str, String route) {
      return FlatButton(
        child: Text(str, style: TextStyle(fontSize: 16,color: Colors.blue[700])),
        onPressed: () {Navigator.pushNamed(context, route);},
      );
    }

    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(title: Text('Account Login')),
         body: Column(
           children: <Widget>[
              /*login text*/
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Log in to your account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700))
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
              /*password text field*/
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password'
                  ),
                )
              ),
              /*forgot email button*/
              Container(
                padding: const EdgeInsets.only(right: 88),
                child: simpleButton('Forgot Email and/or Password?',TestPageRoute),
              ),
              /*create new account or next button*/
              Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                simpleButton('Create Account',RegisterPageRoute),
                SizedBox(width: 120),
                Container(
                  child: RaisedButton(
                    child: Text('Next',),
                    onPressed: () {
                      /*logic for checking account?*/
                      s.loggedIn = true;
                      // Navigator.pushNamed(context, HomePageRoute);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                      return new MyApp();}));
                    },
                  )
                )
              ],),)
           ],
         ),
         floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },),
      )
    );
  }
}