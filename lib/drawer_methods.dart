import 'package:flutter/material.dart';
import 'drawer_login.dart';
// import 'globals.dart';
import 'drawer.dart';
import 'single_loggedIn.dart';

Container getDrawer() {
  var s = singletonLoggedIn;
  if (s.loggedIn) {
    return Container(
      child: MyDrawer()
    );
  } else {
    return Container(
      child: MyDrawerLogin()
    );
  }
}