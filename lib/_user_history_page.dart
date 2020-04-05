import 'package:cs491/globals.dart';
import 'package:cs491/recipe_class.dart';
import 'package:cs491/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '_result_page.dart';
import 'drawer_methods.dart';
import 'result_page_methods.dart';
import 'sorting_methods.dart';
List<Recipe> history = [];
class HistoryPageView extends StatelessWidget {
  const HistoryPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tempWidth = MediaQuery.of(context).size.width - 188;
    int _currentIndex = 0;

    _onTap(int tabIndex) {
      switch(tabIndex) {
        case 0: 
          if (pageNumber == 0) break;
          else 
            pageNumber--;
          break;
        case 1:
          pageNumber++;
          break;
      }
      // Navigator.pushNamed(context, ResultPageRoute);
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

            sortButtonh(Icons.star_border, "Ratings", ratingAscending, context),
            sortButtonh(Icons.timer, "Time", timeAscending, context),
            sortButtonh(Icons.sort_by_alpha, "Alphabetical", alphabeticalAscending, context),

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
    return MaterialApp(
      home: Scaffold(
        drawer: getDrawer(),
        appBar: AppBar(
          title: Text('History'),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              title: Text('Previous'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios),
              title: Text('Next')
            ),
          ],
          onTap: _onTap(_currentIndex)

        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
          },),
        body: ListView(
          children: [
            getRecipehButtons()
          ],
        ),
      ),
    );

  } // Widget build
   // Container recipeButton
}
_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
Widget getRecipehButtons() {
  List<Widget> list = new List<Widget>();
  // print("list length: " + perfectMatchList.length.toString());
  int i = (pageNumber * 10);
  int j = (i + 10);
  for ( ; (i < j && i < history.length) ; i++) {
    list.add(recipeButtonh(i));
      }
      return new Column(children: list);
    }
    
    FlatButton recipeButtonh(int i) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.black38)
      ),
      color: Colors.grey[100],
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          imageRatingSection(history[i].image, i),
          titleTimeReviewSecion(
            history[i].name,
            history[i].totalTime, 
            history[i].numReviews,
            // Make it look like a button
            // Title should be at top rather than centered in the middle
          ),
          FavoriteWidget(),
        ],
      ),
      onPressed: () {
        _launchURL(history[i].url);
      }
  );

}
RaisedButton sortButtonh(IconData icon, String sortName, bool ascending, BuildContext context) {
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