import 'databasehelper.dart';

class StartPage 
{
    final database = DatabaseHelper.instance;

    void _insert(Recipe recipe) async 
    {
      
      // row to insert
      Map<String, dynamic> row = 
      {
        DatabaseHelper.name : recipe.name,
        DatabaseHelper.ingredient1 : recipe.ingredients[0],
        DatabaseHelper.ingredient2 : recipe.ingredients[1],
        DatabaseHelper.ingredient3 : recipe.ingredients[2],
        DatabaseHelper.ingredient4 : recipe.ingredients[3],
        DatabaseHelper.ingredient5 : recipe.ingredients[4],
        DatabaseHelper.ingredient6 : recipe.ingredients[5],
        DatabaseHelper.ingredient7 : recipe.ingredients[6],
        DatabaseHelper.ingredient8 : recipe.ingredients[7],
        DatabaseHelper.ingredient9 : recipe.ingredients[8],
        DatabaseHelper.ingredient10 : recipe.ingredients[9],
        DatabaseHelper.ingredient11 : recipe.ingredients[10],
        DatabaseHelper.ingredient12 : recipe.ingredients[11],
        DatabaseHelper.ingredient13 : recipe.ingredients[12],
        DatabaseHelper.ingredient14 : recipe.ingredients[13],
        DatabaseHelper.ingredient15 : recipe.ingredients[14],
        DatabaseHelper.ingredient16 : recipe.ingredients[15],
        DatabaseHelper.ingredient17 : recipe.ingredients[16],
        DatabaseHelper.ingredient18 : recipe.ingredients[17],
        DatabaseHelper.ingredient19 : recipe.ingredients[18],
        DatabaseHelper.ingredient20 : recipe.ingredients[19],        
        DatabaseHelper.ingredient21 : recipe.ingredients[20],
        DatabaseHelper.ingredient22 : recipe.ingredients[21],
        DatabaseHelper.ingredient23 : recipe.ingredients[22],
        DatabaseHelper.ingredient24 : recipe.ingredients[23],
        DatabaseHelper.ingredient25 : recipe.ingredients[24],
        DatabaseHelper.ingredient26 : recipe.ingredients[25],
        DatabaseHelper.ingredient27 : recipe.ingredients[26],
        DatabaseHelper.ingredient28 : recipe.ingredients[27],
        DatabaseHelper.ingredient29 : recipe.ingredients[28],
        DatabaseHelper.ingredient30 : recipe.ingredients[29],
        DatabaseHelper.ingredient31 : recipe.ingredients[30],
        DatabaseHelper.ingredient32 : recipe.ingredients[31],
        DatabaseHelper.ingredient33 : recipe.ingredients[32],
        DatabaseHelper.ingredient34 : recipe.ingredients[33],
        DatabaseHelper.ingredient35 : recipe.ingredients[34],
        DatabaseHelper.ingredient36 : recipe.ingredients[35],
        DatabaseHelper.ingredient37 : recipe.ingredients[36],
        DatabaseHelper.ingredient38 : recipe.ingredients[37],
        DatabaseHelper.ingredient39 : recipe.ingredients[38],
        DatabaseHelper.ingredient40 : recipe.ingredients[39],
        DatabaseHelper.rating : recipe.grade.rating,
        DatabaseHelper.numOfReviews : recipe.grade.numReviews,
        DatabaseHelper.url : recipe.url,
        DatabaseHelper.urlId : recipe.urlId,
        DatabaseHelper.source : "allrecipe",
        DatabaseHelper.prepTime : recipe.prepTime,
        DatabaseHelper.cookingTime : recipe.cookingTime,
        DatabaseHelper.totalTime : recipe.totalTime
      };
      final id = await database.insert(row);
      print('inserted row id: $id');
  }
