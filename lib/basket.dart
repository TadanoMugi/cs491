import 'package:cs491/globals.dart';
import 'package:flutter/material.dart';
import 'routing_constants.dart';
import 'recipe_class.dart';
import 'database.dart';

// List<String> basket = new List<String>();
List<String> basket = []; 

Widget buildBasket(BuildContext context) {

  void _showDialogEmptyBasket() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("ERROR"),
          content: new Text("Basket is empty"),
          actions: <Widget>[
            new RaisedButton(
              child: new Text("close"),
              onPressed: () {Navigator.of(context).pop();},
            )
          ],
        );
      }
    );
  }

  _showDialogEmptyList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("ERROR"),
          content: new Text("No Results from Ingredients Chosen."),
          actions: <Widget>[
            new RaisedButton(
              child: new Text("close"),
              onPressed: () {Navigator.of(context).pop();},
            )
          ],
        );
      }
    );
  }

  return new AlertDialog(
    title: const Text(
      'Basket',
      textAlign: TextAlign.center,
    ),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        RichText(
          text: new TextSpan(
            text: 'Tap an ingredient to remove it from the basket\n',
            style: const TextStyle(color: Colors.black87),
          )
        ),
        Card(
          color: Colors.grey[200],
          child: ListTile(
            title: Text('Clear Basket',
            style: TextStyle(fontWeight: FontWeight.w700),),
            onTap: () {
              basket.clear();
              Navigator.pop(context);
            }
        )
          // color: Colors.grey[100],
          // textColor: Colors.blue[400],
          // onTap: null,
          // child: const Text(
          //   'Clear Basket',
          // ), 
        ),
        Expanded(
          child: new MyBasket()
        ),
        
      ],
      
    ),
    actions: <Widget>[
      new Row(
        children: <Widget>[
          new RaisedButton(
            color: Colors.grey[100],
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Go back',
              style: TextStyle(
                color: Colors.red,
              )
            )
          ),
          new SizedBox(width: 20,),
          new RaisedButton(
            color: Colors.grey[100],
            onPressed: ()  /*async*/  {
                //Future<List<Recipe>> copyOfRecipeDatabase = startDatabase();
                //searchDatabase(await copyOfRecipeDatabase, basket);
                // await startDatabase();
                if(basket.length == 0) {
                  _showDialogEmptyBasket();
                } else {
                  searchDatabase(recipeTable, basket);
                  if (perfectMatchList.length == 0) {
                    _showDialogEmptyList();
                  } else Navigator.pushNamed(context, ResultPageRoute);
                }
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Find me a recipe!'),
          ),
          new SizedBox(width: 10,),
        ],
      ),

      
    ],
    
  );
}

/* ==================================================
// dynamic basket list that can be removed
================================================== */
class MyBasket extends StatefulWidget {
  @override
  _MyBasketState createState() => _MyBasketState();
}
class _MyBasketState extends State<MyBasket> {
  List<String> list = basket;

  @override
  Widget build(BuildContext context) {
    if (list.length == 0) {
      return new Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            // *WARNING: weeb gif
            Image.asset(
              "images/gif_cry.gif",
              height: 200.0,
              width: 200.0,
            ),
            Text('THE LIST IS EMPTY')
          ],
        )
        
      );
    } else {
      return new Scaffold(
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return MyItem(list[index], onDelete: () => removeItem(index));
          },
        )
      );
    }
  }

/* ==================================================
// function for removing items in basket/list
================================================== */
  void removeItem(int index) {
    setState(() {
      list = List.from(list)
        ..removeAt(index);
    });
    basket = List.from(basket)
        ..removeAt(index);
  }
}

/* ==================================================
// this creates each "card" in basket
================================================== */
class MyItem extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;

  MyItem(this.title, {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.title),
        onTap: this.onDelete,
      )
    );
  }
}