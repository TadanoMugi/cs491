import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'recipe_class.dart';
import 'user_class.dart';
import 'globals.dart';

Database database;
class DatabasePageView extends StatelessWidget {
  const DatabasePageView({Key key}) : super(key: key);
  @override 
  Widget build (BuildContext) {}
}

/*Future<List<Recipe>>*/ Future startDatabase() async
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
      ByteData data = await rootBundle.load(join("assets/RFDB2.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      
      //Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // Open the database
    database = await openDatabase(path, readOnly: true);
    
    print (database.isOpen);
    //List<Recipe> recipeList = new List();
    try
    {
       recipeTable = await retrieveRecipeTable(database);
       userTable = await retrieveUserTable(database);
    }catch (Exception)
    {
      print(Exception);
    }

    //return list;
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

Future<List<User>> retrieveUserTable(database) async 
{
  final List<Map<String, dynamic>> userTable = await database.rawQuery('SELECT * FROM usertable');
  List<User> userList = new List();

  for (int tableIndex = 0; tableIndex < userTable.length; tableIndex++)
  {
    User user = new User();
    user.userEmail = userTable[tableIndex]['_email'];
    user.userPassword = userTable[tableIndex]['_password'];
  }  

  return userList;
}

Future<List<Recipe>> retrieveRecipeTable(database) async 
{
  final List<Map<String, dynamic>> recipeTable = await database.rawQuery('SELECT * FROM recipetable');
    
    List<Recipe> recipeList = new List();

    for (int tableIndex = 0; tableIndex < recipeTable.length; tableIndex++) // i == 21 recipes inside db
    {
      Recipe recipe = new Recipe();
      recipe.name = recipeTable[tableIndex]['_recipeName'];
      recipe.image = recipeTable[tableIndex]['_image'];

      // Recipe.Ingredients list: 0->39
      // tableIndex: 0->database.length
      // '_ingredient': 1-40 
      for (int ingredientIndex = 0, stringIndex = 1; ingredientIndex < 40; ingredientIndex++, stringIndex++) // 39 x 21 = 819 // j == 40 columns of ingredients
      {
        recipe.ingredients.add("");
        recipe.ingredients[ingredientIndex] = (recipeTable[tableIndex]['_ingredient' + (stringIndex).toString()]);
      }  
      recipe.rating = recipeTable[tableIndex]['_rating'].toDouble();
      recipe.numReviews = recipeTable[tableIndex]['_numOfReviews'];
      recipe.url = recipeTable[tableIndex]['_url'];
      recipe.urlId = recipeTable[tableIndex]['_urlId'];
      recipe.source = recipeTable[tableIndex]['_source'];
      String tempPrepTime = recipeTable[tableIndex]['_prepTime'];
      recipe.prepTime = tempPrepTime.toLowerCase().trim();
      String tempCookingTime = recipeTable[tableIndex]['_cookingTime'];
      recipe.cookingTime = tempCookingTime.toLowerCase().replaceAll(" : ", "").trim();
      String tempTotalTime = recipeTable[tableIndex]['_totalTime'];
      recipe.totalTime = tempTotalTime.toLowerCase().replaceAll("ready in ", "").trim();
 
      // recipe.nutrition.calories = recipeTable[tableIndex]['_calories'];
      // recipe.nutrition.carbohydrates = recipeTable[tableIndex]['_carbohydrate'];
      // recipe.nutrition.cholesterol = recipeTable[tableIndex]['_cholesterol'];
      // recipe.nutrition.fat = recipeTable[tableIndex]['_fat'];
      // recipe.nutrition.sodium = recipeTable[tableIndex]['_sodium'];
      // recipe.nutrition.protein = recipeTable[tableIndex]['_protein'];
      // recipe.cuisine = recipeTable[tableIndex]["_cuisine"];

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
        int relevanceCounter = 0;
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
                relevanceCounter++;                
                break;
              }
            }
         }
         recipeList[tableIndex].relevance = relevanceCounter;
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