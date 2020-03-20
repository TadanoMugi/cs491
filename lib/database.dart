import 'dart:io';
import 'package:flutter/material.dart';
import 'recipe_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database database; 
List<Recipe> perfectMatchList;

class DatabasePageView extends StatelessWidget {
  const DatabasePageView({Key key}) : super(key: key);

  @override 
  Widget build (BuildContext) {}
  // @override
  //   Widget build(BuildContext context) {
  //    return MaterialApp(
  //     home: Scaffold(
  //       body: ListView(
  //         children: [
  //         new RaisedButton(
  //            color: Colors.blue[100],
  //           onPressed: () {
  //             start();
  //             Navigator.pushNamed(context, ResultPageRoute);
  //           },
  //         ),
  //         ], 
  //       ),
  //     ),
  //   );
  // } // Widget build

}

Future<List<Recipe>> startDatabase() async
{
  WidgetsFlutterBinding.ensureInitialized();
  var databasesPath = await getDatabasesPath(); 
  String path = join(databasesPath, 'RFDB_working.db');

  // Check if the database exists
  var exists = await databaseExists(path);

  if (!exists) {
  // Should happen only the first time you launch your application
    print("Creating new copy from asset");

    //Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (Exception) {
      print(Exception);
    }
      
    //Copy from asset
    ByteData data = await rootBundle.load(join("assets/RFDB.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    
    //Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);

  } else {
    print("Opening existing database");
  }
  // Open the database
  database = await openDatabase(path, readOnly: true);
  
  print (database.isOpen);
  List<Recipe> list = new List();
  try
  {
    list = await retrieveData(database);
  }catch (Exception)
  {
    print(Exception);
  }

  return list;
} 

//  NO RETURNS;     THIS NEEDS TO DEFINE A GLOBAL EACH TIME ITS CALLED TO RESET IT  ////
void searchDatabase(List<Recipe> databaseTable, List<String> basket)
{
   perfectMatchList = new List<Recipe>();
   try 
   {
      // Goes through all basket items each recipe (databaseTable holds every row as a linked list: ResultSet) 
      // Ingredient columns: 4 - 44    
      for (int index = 0; index < basket.length; index++) 
      {
        String ingredientSearched = basket.elementAt(index).toLowerCase();
        String ingredientSearchedUpperCased = ingredientSearched.substring(0, 1).toUpperCase() + ingredientSearched.substring(1, ingredientSearched.length);
        for(int j = 0; j < databaseTable.length; j++)
        {
          if (databaseTable[j].ingredients.contains(ingredientSearched) || 
              databaseTable[j].ingredients.contains(ingredientSearchedUpperCased) )
          {	
            perfectMatchList.add(databaseTable[j]);
            //print(databaseTable[j].name);
          }
        }
      }
    
    } catch (Exception)
    {
      print("Search: Didn't work ");
    }
    print ("Search Works!!!");
}


Future<List<Recipe>> retrieveData(database) async 
{
  final List<Map<String, dynamic>> databaseTable = await database.rawQuery('SELECT * FROM recipetable');
    Recipe recipe = new Recipe();
    List<Recipe> recipeList = new List();

    for (int i = 0; i < databaseTable.length; i++)
    {
      recipe.name = databaseTable[i]['_recipeName'];
      recipe.image = databaseTable[i]['_image'];
      for (int j = 1; j < 40; j++)
      {
        recipe.ingredients.add(databaseTable[i]['_ingredients' + j.toString()]);
      }  
      recipe.rating = databaseTable[i]['_rating'];
      recipe.numReviews = databaseTable[i]['_numOfReviews'];
      recipe.url = databaseTable[i]['_url'];
      recipe.urlId = databaseTable[i]['_urlId'];
      recipe.source = databaseTable[i]['_source'];
      recipe.prepTime = databaseTable[i]['_prepTime'];
      recipe.cookingTime = databaseTable[i]['_cookingTime'];
      recipe.totalTime = databaseTable[i]['_totalTime'];
      recipe.nutrition.calories = databaseTable[i]['_calories'];
      recipe.nutrition.carbohydrates = databaseTable[i]['_carbohydrate'];
      recipe.nutrition.cholesterol = databaseTable[i]['_cholesterol'];
      recipe.nutrition.fat = databaseTable[i]['_fat'];
      recipe.nutrition.sodium = databaseTable[i]['_sodium'];
      recipe.nutrition.protein = databaseTable[i]['_protein'];
      recipe.cuisine = databaseTable[i]["_cuisine"];

      recipeList.add(recipe);
    }

    return recipeList;    
}
  
