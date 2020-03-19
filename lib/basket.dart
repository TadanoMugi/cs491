import 'package:flutter/material.dart';

import 'routing_constants.dart';

// List<String> basket = new List<String>();
List<String> basket = [];

Widget buildBasket(BuildContext context) {
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
            onPressed: () {
              Navigator.pushNamed(context, ResultPageRoute);
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
    return new Scaffold(
      body: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return MyItem(list[index], onDelete: () => removeItem(index));
      },
      )
    );
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