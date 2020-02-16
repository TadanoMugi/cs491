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

/* *** FOR USE LATER ***
import 'dart:io';
import 'package:image/image.dart';
void main() {
// Read an image from file (webp in this case).
// decodeImage will identify the format of the image and use the appropriate
// decoder.
Image image = decodeImage(File('test.webp').readAsBytesSync());

// Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
Image thumbnail = copyResize(image, width: 120);

// Save the thumbnail as a PNG.
File('thumbnail.png')..writeAsBytesSync(encodePng(thumbnail));
}
*/