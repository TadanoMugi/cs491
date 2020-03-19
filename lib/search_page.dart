import 'package:flutter/material.dart';

import 'ingredients.dart';
import 'basket.dart';
class SearchPageView extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Ingrediants'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var items = List<String>();

  @override
  void initState() {
    items.addAll(letters);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(letters);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(letters);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                    onTap: () { basket.add(items[index]);
                 _scaffoldKey.currentState.showSnackBar(SnackBar(
                     content: Text("Added ${items[index]}!"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              );
                }
            ),
            ),
          ],
        ),
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
/*final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController editingController = TextEditingController();

  var items = letters;


  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(letters);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
        items.clear();
        items.addAll(dummyListData);
      
      return;
    } else {
       items.clear();
        items.addAll(letters);
      
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Ingredients'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value)
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                    onTap: () { basket.add(items[index]);
                 _scaffoldKey.currentState.showSnackBar(SnackBar(
                     content: Text("Added ${items[index]}!"),
                      duration: Duration(seconds: 1),
                    ));
                }
                  );
                },
              ),
            ),
          ],
        ),
      ),/*ListView(
        padding: EdgeInsets.all(10.0),
        children: letters
          .map((data) => ListTile(
                leading: Icon(null),
                title: Text(data),
                onTap: () { basket.add(data);
                 _scaffoldKey.currentState.showSnackBar(SnackBar(
                     content: Text("Added $data!"),
                      duration: Duration(seconds: 1),
                    ));
                }
              ))
          .toList(),
      ),*/
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
}*/
