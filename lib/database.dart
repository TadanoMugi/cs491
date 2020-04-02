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
    String path = join(databasesPath, 'database.db'); // change 'database.db' whenever database is updated with more entries
    // "/data/user/0/com.example.cs491/databases/RFDB_working.db" is a Root folder and is unaccessible

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

// void searchDatabase(List<Recipe> recipeList, List<String> basket)
// {
//    perfectMatchList = new List<Recipe>();
//    int boolCounter = 0;
//    try 
//    {
//       // Goes through all basket items each recipe (databaseTable holds every row as a linked list: ResultSet) 
//       // Ingredient columns: 4 - 44    
//       for (int basketIndex = 0; basketIndex < basket.length; basketIndex++) 
//       {
//         String ingredientSearched = basket.elementAt(basketIndex).toLowerCase(); // Basket ingredient -> lower case        
//         for(int tableIndex = 0; tableIndex < recipeList.length; tableIndex++)
//         {
//           for (int ingredientListIndex = 0; ingredientListIndex < 40; ingredientListIndex++)
//           {
//             String recipeListIngredient = recipeList[tableIndex].ingredients[ingredientListIndex].toLowerCase();
//             if (recipeListIngredient.contains(ingredientSearched))
//             {	
//               boolCounter++;
//             }
//           }
//           if (boolCounter == basket.length)
//           {
//             perfectMatchList.add(recipeList[tableIndex]);
//           }
//         } // recipeList loop
//       } // basket loop
//     print ("Search Works!!!");
//     } catch (Exception)
//     {
//       print("Search: Didn't work ");
//     }    
// }


Future<List<Recipe>> retrieveData(database) async 
{
  final List<Map<String, dynamic>> databaseTable = await database.rawQuery('SELECT * FROM recipetable');
    
    List<Recipe> recipeList = new List();
    print("DEBUG: " + databaseTable.length.toString());

    for (int tableIndex = 0; tableIndex < databaseTable.length; tableIndex++) // i == 21 recipes inside db
    {
      Recipe recipe = new Recipe();
      recipe.name = databaseTable[tableIndex]['_recipeName'];
      recipe.image = databaseTable[tableIndex]['_image'];

      // Recipe.Ingredients list: 0->39
      // tableIndex: 0->database.length
      // '_ingredient': 1-40 
      for (int ingredientIndex = 0, stringIndex = 1; ingredientIndex < 40; ingredientIndex++, stringIndex++) // 39 x 21 = 819 // j == 40 columns of ingredients
      {
        recipe.ingredients.add("");
        recipe.ingredients[ingredientIndex] = (databaseTable[tableIndex]['_ingredient' + (stringIndex).toString()]);
      }  
      recipe.rating = databaseTable[tableIndex]['_rating'].toDouble();
      recipe.numReviews = databaseTable[tableIndex]['_numOfReviews'];
      recipe.url = databaseTable[tableIndex]['_url'];
      recipe.urlId = databaseTable[tableIndex]['_urlId'];
      recipe.source = databaseTable[tableIndex]['_source'];
      String tempPrepTime = databaseTable[tableIndex]['_prepTime'];
      recipe.prepTime = tempPrepTime.toLowerCase().trim();
      String tempCookingTime = databaseTable[tableIndex]['_cookingTime'];
      recipe.cookingTime = tempCookingTime.toLowerCase().replaceAll(" : ", "").trim();
      String tempTotalTime = databaseTable[tableIndex]['_totalTime'];
      recipe.totalTime = tempTotalTime.toLowerCase().replaceAll("ready in ", "").trim();
 
      // recipe.nutrition.calories = databaseTable[tableIndex]['_calories'];
      // recipe.nutrition.carbohydrates = databaseTable[tableIndex]['_carbohydrate'];
      // recipe.nutrition.cholesterol = databaseTable[tableIndex]['_cholesterol'];
      // recipe.nutrition.fat = databaseTable[tableIndex]['_fat'];
      // recipe.nutrition.sodium = databaseTable[tableIndex]['_sodium'];
      // recipe.nutrition.protein = databaseTable[tableIndex]['_protein'];
      // recipe.cuisine = databaseTable[tableIndex]["_cuisine"];

      recipeList.add(recipe);
    }
    return recipeList;    
}

// Output: recipes that include one or more basket ingredient  
void searchDatabase(List<Recipe> recipeList, List<String> basket)
{
  perfectMatchList = new List<Recipe>();

   try 
   {
      // Goes through the entire database once for all basket items
      for(int tableIndex = 0; tableIndex < recipeList.length; tableIndex++)
      {
        //bool perfectMatchCheck = true; 
        int boolCounter = 0;
        for (int basketIndex = 0; basketIndex < basket.length; basketIndex++) 
        {
            // Basket ingredient -> lower case
            String ingredientSearched = basket.elementAt(basketIndex).toLowerCase();        
            for (int ingredientListIndex = 0; ingredientListIndex < 40; ingredientListIndex++)
            {
              String recipeListIngredient = recipeList[tableIndex].ingredients[ingredientListIndex].toLowerCase();
              if (recipeListIngredient == "")
              {
                // Stops checking the rest of a recipe's ingredient list and moves on to the next basket item
                break;
              }
              if (recipeListIngredient.contains(ingredientSearched))
              {	
                boolCounter++;
              }
            }
         }
         if (boolCounter == basket.length)
         {
           perfectMatchList.add(recipeList[tableIndex]);
         }
      } // Table
      print ("Search Works!!!");
    } catch (Exception)
    {
      print("Search: Didn't work ");
    }    
}