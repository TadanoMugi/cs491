import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'recipe_class.dart';
import 'globals.dart';

Database database;
class DatabasePageView extends StatelessWidget {
  const DatabasePageView({Key key}) : super(key: key);
  @override 
  Widget build (BuildContext) {}
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
      for (int basketIndex = 0; basketIndex < basket.length; basketIndex++) 
      {
        String ingredientSearched = basket.elementAt(basketIndex).toLowerCase(); // Basket ingredient -> lower case
       // String ingredientSearchedUpperCased = ingredientSearched.substring(0, 1).toUpperCase() + ingredientSearched.substring(1, ingredientSearched.length);
        
        for(int tableIndex = 0; tableIndex < databaseTable.length; tableIndex++)
        {
          for (int ingredientListIndex = 0; ingredientListIndex < 40; ingredientListIndex++)
          {
            String databaseTableIngredient = databaseTable[tableIndex].ingredients[ingredientListIndex].toLowerCase();
            if (databaseTableIngredient.contains(ingredientSearched))
            {	
              perfectMatchList.add(databaseTable[tableIndex]);
            }
          }
        }
      }
    print ("Search Works!!!");
    } catch (Exception)
    {
      print("Search: Didn't work ");
    }
    
}


Future<List<Recipe>> retrieveData(database) async 
{
  final List<Map<String, dynamic>> databaseTable = await database.rawQuery('SELECT * FROM recipetable');
    
    List<Recipe> recipeList = new List();
    // String str = '';

    for (int tableIndex = 0; tableIndex < databaseTable.length; tableIndex++) // i == 21 recipes inside db
    {
      Recipe recipe = new Recipe();
      recipe.name = databaseTable[tableIndex]['_recipeName'];
      // print ("recipeList Name: " + recipe.name);
      recipe.image = databaseTable[tableIndex]['_image'];
      // recipe.ingredients.add(String());

      // Recipe.Ingredients list: 0->39
      // tableIndex: 0->database.length
      // '_ingredient': 1-40 
      for (int ingredientIndex = 0, stringIndex = 1; ingredientIndex < 40; ingredientIndex++, stringIndex++) // 39 x 21 = 819 // j == 40 columns of ingredients
      {
        recipe.ingredients.add("");
        recipe.ingredients[ingredientIndex] = (databaseTable[tableIndex]['_ingredient' + (stringIndex).toString()]);
        // recipe.ingredients.add(databaseTable[i]['_ingredient' + (j).toString()]);
      }  
      recipe.rating = databaseTable[tableIndex]['_rating'].toDouble();
      recipe.numReviews = databaseTable[tableIndex]['_numOfReviews'];
      recipe.url = databaseTable[tableIndex]['_url'];
      recipe.urlId = databaseTable[tableIndex]['_urlId'];
      recipe.source = databaseTable[tableIndex]['_source'];
      recipe.prepTime = databaseTable[tableIndex]['_prepTime'];
      recipe.cookingTime = databaseTable[tableIndex]['_cookingTime'];
      recipe.totalTime = databaseTable[tableIndex]['_totalTime'];
      // recipe.nutrition.calories = databaseTable[tableIndex]['_calories'];
      // recipe.nutrition.carbohydrates = databaseTable[tableIndex]['_carbohydrate'];
      // recipe.nutrition.cholesterol = databaseTable[tableIndex]['_cholesterol'];
      // recipe.nutrition.fat = databaseTable[tableIndex]['_fat'];
      // recipe.nutrition.sodium = databaseTable[tableIndex]['_sodium'];
      // recipe.nutrition.protein = databaseTable[tableIndex]['_protein'];
      // recipe.cuisine = databaseTable[tableIndex]["_cuisine"];

      recipeList.add(recipe);
    }

    // print("name: " + recipeList[0].name);
    // print("ingredient: " + recipeList[0].ingredients[0].toString());


    return recipeList;    
}
  
