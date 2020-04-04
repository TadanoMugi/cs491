import 'package:cs491/globals.dart';
import 'package:flutter/material.dart';
import 'drawer_methods.dart';
import 'result_page_methods.dart';
import 'routing_constants.dart';

double fontSizeValue = 13;
double tempWidth;

class ResultPageView extends StatelessWidget {
  const ResultPageView({Key key}) : super(key: key);

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
            getRecipeButtons()
          ],
        ),
      ),
    );

  } // Widget build

} // class TestView
