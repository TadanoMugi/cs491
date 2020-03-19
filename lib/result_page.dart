import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'result_page_methods.dart';

double fontSizeValue = 13;
double tempWidth;

class ResultPageView extends StatelessWidget {
  const ResultPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseHelper database;
    // database.start();

    tempWidth = MediaQuery.of(context).size.width - 188;

    String imageOfRecipe = 'images/cookie.jpg';
    String timeValue = '30m';
    String difficultyValue = 'easy';
    String titleValue = 'Peanut Butter Chip Chocolate Cookies';
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Search Results')),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },),
        body: Column(
          children: [
            recipeButton(titleValue,imageOfRecipe,timeValue,difficultyValue),
            // _recipeButton('testing',testImage,'',''),
          ],
        ),
      ),
    );

  } // Widget build

} // class TestView
