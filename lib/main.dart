import 'package:flutter/material.dart';
import 'routes.dart' as routes;
import 'routing_constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cs491 Recipe Finder',
      onGenerateRoute: routes.generateRoute,
      initialRoute: HomePageRoute,
    );
  }
}