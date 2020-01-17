import 'package:flutter/material.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      },),
      body: Center(
        child: Text('Search Page'),
      ),
    );
  }
}