import 'package:flutter/material.dart';
import '_result_page.dart';

// double fontSizeValue = 13;

Image resizedImage(String originalImage) {
  return Image.asset(
    originalImage,
    width: 120,
    height: 120,
    scale: 3.5,
    fit: BoxFit.none,
  );
}

Text boldBlackText(String stringText) {
  return Text(
    stringText,
    style: TextStyle(
      fontSize: fontSizeValue,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text regularBlackText(String stringText) {
  return Text(
    stringText,
    style: TextStyle(
      fontSize: fontSizeValue,
      color: Colors.black,
    ),
  );
}

Widget titleText(String title) {
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

Container imageRatingSection(String imageString) {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        resizedImage(imageString),
        ratingSubSection,
      ],
    ),
  );
}

Container timeSubSection(String time) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        boldBlackText('Time: '),
        regularBlackText(time),
      ],
    ),
  );
}

Container difficultySubSection(String difficulty) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        boldBlackText('Difficulty: '),
        regularBlackText(difficulty),
      ],
    ),
  );
}

Container titleSubSection(String title) {
  return Container(
    margin: EdgeInsets.only(top: 5, left: 5),  
    constraints: new BoxConstraints(
      maxWidth: tempWidth),
      child: titleText(title),
  );
}

Container titleTimeDifficultySecion(String title, String time, String difficulty) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSubSection(title),
        timeSubSection(time),
        difficultySubSection(difficulty),
      ],
    ),
  );
}

FlatButton recipeButton(String title, String image, String time, String difficulty) {
  return FlatButton(
    color: Colors.grey[100],
    padding: EdgeInsets.only(top: 5, bottom: 5),
    child: Row(
      children: [
        imageRatingSection(image),
        titleTimeDifficultySecion(title, time, difficulty),
        FavoriteWidget(),
      ],
    ),
    onPressed: null,
  );
} // Container _recipeButton

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