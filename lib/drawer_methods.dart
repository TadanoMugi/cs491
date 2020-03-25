import 'package:flutter/material.dart';
import 'drawer_login.dart';
import 'globals.dart';
import 'drawer.dart';

Container getDrawer() {
  if (loggedIn) {
    return Container(
      child: MyDrawer()
    );
  } else {
    return Container(
      child: MyDrawerLogin()
    );
  }
}