import'dart:core';
import 'dart:typed_data';
import 'grade_class.dart';
import 'nutrition_class.dart';

class Recipe
{
  String name;
  List<String> ingredients;
  //Nutrition nutrition;
  ByteBuffer image;
  Grade grade;
  String url;
  String urlId;
  String prepTime;
  String cookingTime;
  String totalTime;    

  Recipe()
  {
      this.name = "";
      //this.nutrition = Objects.requireNonNull(nutrition);
      this.ingredients = new List();
      this.grade = new Grade(0, 0);
      this.image = null;
      this.url = "";
      this.urlId = "";
      this.prepTime = "";
      this.cookingTime = "";
      this.totalTime = "";
  }

  SetRecipe(String name, List<String> ingredients, double score,int count, ByteBuffer image, 
            String url, String urlId, String prepTime, String cookingTime, String totalTime) 
  {
      this.name = name;
      //this.nutrition = Objects.requireNonNull(nutrition);
      this.ingredients = ingredients;
      this.grade = new Grade(score,count);
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