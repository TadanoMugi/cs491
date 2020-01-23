import 'package:flutter/material.dart';

import 'routing_constants.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, ResultPageRoute);
      },),
      body: Center(
        child: Text('Search Page'),
      ),
    );
  }
}