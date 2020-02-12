import 'dart:io';

import 'package:cs491/recipe_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper 
{  
   void start() async
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
      ByteData data = await rootBundle.load(join("assets/databases/RFDB.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      
      //Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // Open the database
    Database database = await openDatabase(path, readOnly: true);
    
    print (database.isOpen);
    List<Recipe> list = new List();
    try
    {
      list = await retrieveData(database);
      print ("Worked!");
    }catch (Exception)
    {
      print(Exception);
    }

    print("Database set");
} 
}



Future<List<Recipe>> retrieveData(database) async 
{
  final List<Map<String, dynamic>> maps = await database.rawQuery('SELECT * FROM recipetable');
  print(maps); // this is correct and have the info; 
    Recipe recipe = new Recipe();
    List<Recipe> recipeList = new List();

    for (int i = 0; i < maps.length; i++)
    {
      recipe.name = maps[i]['_recipeName'];
      recipe.image = maps[i]['_image'];
      for (int j = 1; j < 40; j++)
      {
        recipe.ingredients.add(maps[i]['_ingredients' + j.toString()]);
      }  
      recipe.rating = maps[i]['_rating'];
      recipe.numReviews = maps[i]['_numOfReviews'];
      recipe.url = maps[i]['_url'];
      recipe.urlId = maps[i]['_urlId'];
      recipe.source = maps[i]['_source'];
      recipe.prepTime = maps[i]['_prepTime'];
      recipe.cookingTime = maps[i]['_cookingTime'];
      recipe.totalTime = maps[i]['_totalTime'];
      
      recipeList.add(recipe);
    }

    return recipeList;
    
}
  
