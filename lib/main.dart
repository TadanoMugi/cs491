import 'package:flutter/material.dart';
import 'routes.dart' as routes;
import 'routing_constants.dart';
import 'single_loggedIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*Initialize singleton loggedIn at startup*/
    // var s = singletonLoggedIn;
    // s.loggedIn = true;

    return MaterialApp(
      title: 'cs491 Recipe Finder',
      onGenerateRoute: routes.generateRoute,
      initialRoute: HomePageRoute,
    );
  }
}