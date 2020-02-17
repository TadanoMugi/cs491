import 'package:flutter/material.dart';

import 'database_helper.dart';

class ResultPageView extends StatelessWidget {
  const ResultPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseHelper database;
    //database.start();

    String imageOfRecipe = 'images/cookie.jpg';
    // String testImage = 'images/notCookie.png';
    String timeValue = '30m';
    String difficultyValue = 'easy';
    String titleValue = 'Peanut Butter Chip Chocolate Cookies';
    double fontSizeValue = 13;

    Image _resizedImage(String originalImage) {
      return Image.asset(
        originalImage,
        width: 120,
        height: 120,
        scale: 3.5,
        fit: BoxFit.none,
      );
    }

    Text _boldBlackText(String stringText) {
      return Text(
        stringText,
        style: TextStyle(
          fontSize: fontSizeValue,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Text _regularBlackText(String stringText) {
      return Text(
        stringText,
        style: TextStyle(
          fontSize: fontSizeValue,
          color: Colors.black,
        ),
      );
    }

    Text _titleText(String title) {
      return Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        softWrap: true,
      );
    }

    Widget ratingSubSection = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Icon(
            Icons.star_half,
            color: Colors.red[500],
          ),
          Icon(
            Icons.star_border,
            color: Colors.red[500],
          ),
        ],
      ),
    );

    Container _imageRatingSection(String imageString) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _resizedImage(imageString),
            ratingSubSection,
          ],
        ),
      );
    }

    Container _timeSubSection(String time) {
      return Container(
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _boldBlackText('Time: '),
            _regularBlackText(time),
          ],
        ),
      );
    }

    Container _difficultySubSection(String difficulty) {
      return Container(
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _boldBlackText('Difficulty: '),
            _regularBlackText(difficulty),
          ],
        ),
      );
    }

    Container _titleSubSection(String title) {
      return Container(
        margin: EdgeInsets.only(top: 5, left: 5),  
        constraints: new BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 188),
          child: _titleText(title),
      );
    }

    Container _titleTimeDifficultySecion(String title, String time, String difficulty) {
      return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleSubSection(title),
            _timeSubSection(time),
            _difficultySubSection(difficulty),
          ],
        ),
      );
    }

    Container _recipeButton(String title, String image, String time, String difficulty) {
      return Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          children: [
            _imageRatingSection(image),
            _titleTimeDifficultySecion(title, time, difficulty),
            FavoriteWidget(),
          ],
        ),
      );
    } // Container _recipeButton

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Search Results')),
        body: Column(
          children: [
            _recipeButton(titleValue,imageOfRecipe,timeValue,difficultyValue),
            // _recipeButton('testing',testImage,'',''),
          ],
        ),
      ),
    );

  } // Widget build

} // class TestView

// the favorite button
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(right: 5),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
      )
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

}

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