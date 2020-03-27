import 'package:flutter/material.dart';
import '_result_page.dart';
import 'globals.dart';

double fontSizeValue = 13;

Widget getRecipeButtons() {
  List<Widget> list = new List<Widget>();
  // print("list length: " + perfectMatchList.length.toString());
  for (int i = 0; i < perfectMatchList.length; i++) {
    list.add(recipeButton(i));
  }
  return new Column(children: list);
}

Image resizedImage(String originalImage) {
  return Image.network(
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

Icon full() {
  return Icon(Icons.star,color: Colors.red);
}
Icon half() {
  return Icon(Icons.star_half,color: Colors.red);
}
Icon empty() {
  return Icon(Icons.star_border,color: Colors.red);
}

Icon getRatingIcon(double low, double high, int i) {
  if (perfectMatchList[i].rating < low)
    return empty();
  else if (perfectMatchList[i].rating >= low && perfectMatchList[i].rating < high) 
    return half();
  else if (perfectMatchList[i].rating >= high)
    return full();
  return Icon(Icons.error);
}

Container ratingSubSection(int i) {
  return Container(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        full(),
        getRatingIcon(1.25, 1.75, i),
        getRatingIcon(2.25, 2.75, i),
        getRatingIcon(3.25, 3.75, i),
        getRatingIcon(4.25, 4.75, i),
      ],
    ),
  );
}

Container imageRatingSection(String imageString, int i) {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        resizedImage(imageString),
        ratingSubSection(i),
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

Container titleSubSection(String title) {
  return Container(
    margin: EdgeInsets.only(top: 5, left: 5),  
    constraints: new BoxConstraints(
      maxWidth: tempWidth),
      child: titleText(title),
  );
}

Container titleTimeDifficultySecion(String title, String time/*, String difficulty*/) {
  return Container(
    margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSubSection(title),
        SizedBox(height: 20,),
        timeSubSection(time),
      ],
    ),
  );
}

FlatButton recipeButton(int i) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.black38)
      ),
      color: Colors.grey[100],
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          imageRatingSection(perfectMatchList[i].image, i),
          titleTimeDifficultySecion(
            perfectMatchList[i].name,
            perfectMatchList[i].totalTime, 
            //perfectMatchList[i].numOfReviews,
            // Make it look like a button
            // Title should be at top rather than centered in the middle
          ),
          FavoriteWidget(),
        ],
      ),
      onPressed: null, //perfectMatchList[i].url
  );

} // Container recipeButton

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