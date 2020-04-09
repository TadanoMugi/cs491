import 'package:cs491/globals.dart';
import 'package:flutter/material.dart';
import 'drawer_methods.dart';
import 'result_page_methods.dart';
import 'routing_constants.dart';

double fontSizeValue = 13;
double tempWidth;
String tempText = '';

class ResultPageView extends StatelessWidget {
  const ResultPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tempWidth = MediaQuery.of(context).size.width - 188;

    return MaterialApp(
      home: Scaffold(
        drawer: getDrawer(),
        appBar: AppBar(
          title: Text('Search Result Recipes'),
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
        bottomNavigationBar: 
          Row(children: <Widget>[
            SizedBox(width: 5,),
            Expanded(child: RaisedButton(
              color: Colors.blue[400],
              textColor: Colors.white,
              onPressed: () {
                if(pageNumber > 0) {
                  pageNumber--;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ResultPageRoute);
                }
              },
              child: Text(
                pageNumber == 0 ? '' : previousText()
                ),
            ),),
            SizedBox(width: 5,),
            Expanded(child: RaisedButton(
              color: Colors.blue[400],
              textColor: Colors.white,
              onPressed: () {
                pageNumber++;
                Navigator.pop(context);
                Navigator.pushNamed(context, ResultPageRoute);
              },
              child: Text(nextText()),
            )),
            SizedBox(width: 5,)
          ],),
        
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushNamed(context, SearchPageRoute);
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

String nextText() {
  String tempText = 'Recipes ' + (pageNumber * 10 + 1).toString() 
    + ' - '  + (pageNumber * 10 + 10).toString();
  return tempText;
}

String previousText() {
  tempText = '';
  if (pageNumber > 0) {
    tempText = 'Recipes ' + (pageNumber * 10 - 9).toString() 
      + ' - ' + (pageNumber * 10).toString();
  }
  return tempText;
}