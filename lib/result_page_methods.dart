import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '_result_page.dart';
import 'globals.dart';
import 'routing_constants.dart';
import 'sorting_methods.dart';
import '_user_history_page.dart';

double fontSizeValue = 13;

void boolModifier(String sortName, bool ascending) {
  print("boolMod start");
  switch (sortName) {
    case "Ratings":
      if (ratingAscending == true) 
        ratingAscending = false;
      else ratingAscending = true;
      print("ratingAscending: " + ratingAscending.toString());
      break;
    case "Time":
      if (timeAscending == true) 
        timeAscending = false;
      else timeAscending = true;
      break;
    case "Alphabetical":
      if (alphabeticalAscending == true) 
        alphabeticalAscending = false;
      else alphabeticalAscending = true;
      break;
    default: print("DEBUG: switch boolModifier default"); break;
  }
}

void sortPerfectMatchList(String sortName, bool ascending) {
  switch (sortName) { 
    case "Ratings":
      if (ascending) HighestRating(perfectMatchList);
      else LowestRating(perfectMatchList);
      break;
    case "Time":
      if (ascending) TotalTimeAscending(perfectMatchList);
      else TotalTimeDescending(perfectMatchList);
      break;
    case "Alphabetical":
      if (ascending) AlphabeticalAscending(perfectMatchList);
      else AlphabeticalDescending(perfectMatchList);
      break;
    default: print("DEBUG: switch sortPerfectMatchList default"); break;
  }
}

RaisedButton sortButton(IconData icon, String sortName, bool ascending, BuildContext context) {
  return RaisedButton(
    color: Colors.grey[100],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        (!ascending) ? Icon(Icons.arrow_downward) : Icon(Icons.arrow_upward),
        Icon(icon),
        Text(" " + sortName + " " + (ascending ? "Ascending" : "Descending"))
      ],),
    onPressed: () {
      sortPerfectMatchList(sortName, ascending);
      boolModifier(sortName, ascending);
      Navigator.pushNamed(context, ResultPageRoute);
    }
  );
}

void sortDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))),
          contentPadding: EdgeInsets.only(top: 10),
        title: const Text('Sort', textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                text: 'Tap a button to select a sorting method\n',
                style: const TextStyle(color: Colors.black87),
              )
            ),

            sortButton(Icons.star_border, "Ratings", ratingAscending, context),
            sortButton(Icons.timer, "Time", timeAscending, context),
            sortButton(Icons.sort_by_alpha, "Alphabetical", alphabeticalAscending, context),

            SizedBox(height: 10),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))
                ),
                child: Text(
                  'Go back',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () { Navigator.of(context).pop(); }
            )
          ],),
      );
    }
  );
}

Widget getRecipeButtons() {
  List<Widget> list = new List<Widget>();
  // print("list length: " + perfectMatchList.length.toString());
  int i = (pageNumber * 10);
  int j = (i + 10);
  for ( ; i < j; i++) {
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
        (time == "null") ? regularBlackText('not specified') : regularBlackText(time)
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

Container sourceSubSection() {
  return Container(
    margin: EdgeInsets.all(5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        boldBlackText('Source: '),
        regularBlackText('allrecipes.com'),
      ],
    )
  );
}

Container reviewSubSection(int numReviews) {
  return Container(
    margin: EdgeInsets.all(5),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        boldBlackText('Number of Reviews: '),
        regularBlackText(numReviews.toString())
      ],
    )
  );
}

Container titleTimeReviewSecion(String title, String time, int numReviews) {
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
        sourceSubSection(),
        reviewSubSection(numReviews)
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
          titleTimeReviewSecion(
            perfectMatchList[i].name,
            perfectMatchList[i].totalTime, 
            perfectMatchList[i].numReviews,
            // Make it look like a button
            // Title should be at top rather than centered in the middle
          ),
          FavoriteWidget(),
        ],
      ),
      onPressed: () {
        history.add(perfectMatchList[i]);
        _launchURL(perfectMatchList[i].url);
      }
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

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
