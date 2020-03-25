import'dart:core';
import 'dart:typed_data';
import 'nutrition_class.dart';
 
class Recipe
{
  String name;
  // new
  List<String> ingredients;
  Nutrition nutrition;
  ByteBuffer image;
  double rating;
  int numReviews;
  String url;
  String urlId;
  String source;
  String prepTime;
  String cookingTime;
  String totalTime;    
  String cuisine;

  Recipe()
  {
      this.name = "";
      this.nutrition = null;
      this.ingredients = new List<String>();
      this.rating = 0;
      this.numReviews = 0;
      this.image = null;
      this.url = "";
      this.urlId = "";
      this.prepTime = "";
      this.cookingTime = "";
      this.totalTime = "";
      this.cuisine = "";
  }

  SetRecipe(String name, Nutrition nutrition, List<String> ingredients, double score,int count, ByteBuffer image, 
            String url, String urlId, String prepTime, String cookingTime, String totalTime) 
  {
      this.name = name;
      this.nutrition = nutrition;
      this.ingredients = ingredients;
      this.rating = score;
      this.numReviews = count;
      this.image = image;
      this.url = url;
      this.urlId = urlId;
      this.prepTime = prepTime;
      this.cookingTime = cookingTime;
      this.totalTime = totalTime;
  }

  // Optional<ByteBuffer> getImage() {
  //     return Optional.of(image);
  // }

  // List<String> getIngredients() {
  //     return Collections.unmodifiableList(ingredients);
  // }

  // Nutrition getNutrition() {
  //     return nutrition;
  // }

     

}