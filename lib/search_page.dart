import 'package:flutter/material.dart';

import 'ingredients.dart';
import 'routing_constants.dart';
import 'basket.dart';

class SearchPageView extends StatelessWidget {

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Ingredients'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: letters
          .map((data) => ListTile(
                leading: Icon(null),
                title: Text(data),
                onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("$data added!"),
                      duration: Duration(seconds: 1),
// @terrance, figure out how to add these to basket from basket.dart
                    )),
              ))
          .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: Icon(Icons.shopping_basket),
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) => buildBasket(context),
          );
        },
      ),
    );
  }
}
