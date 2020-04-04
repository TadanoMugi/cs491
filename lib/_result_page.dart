import 'package:flutter/material.dart';
import 'drawer_methods.dart';
import 'result_page_methods.dart';

double fontSizeValue = 13;
double tempWidth;
bool ratingAscending;
bool timeAscending;
bool alphabeticalAscending;

class ResultPageView extends StatelessWidget {
  const ResultPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tempWidth = MediaQuery.of(context).size.width - 188;
    ratingAscending = true;
    timeAscending = true;
    alphabeticalAscending = true;
    
    return MaterialApp(
      home: Scaffold(
        drawer: getDrawer(),
        appBar: AppBar(
          title: Text('Search Results'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {sortDialog(context);},
                child: Icon(Icons.sort) // sort
              )
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert) // filter
              )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },),
        body: ListView(
          children: [
            getRecipeButtons()
          ],
        ),
      ),
    );

  } // Widget build

} // class TestView
