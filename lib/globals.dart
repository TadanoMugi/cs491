import 'recipe_class.dart';
import 'user_class.dart';

List<Recipe> recipeTable;   // Database copy of Recipes
List<User> userTable;       // Database copy of Users
List<Recipe> perfectMatchList; // Results list: exact matches
// bool loggedIn = true;
bool ratingAscending = false;
bool timeAscending = true;
bool alphabeticalAscending = true;
int pageNumber = 0;
int resultsPerPage = 10;
List<Recipe> history = [];

String tempurl = 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5642837.jpg&w=596&h=792.6800000000001&c=sc&poi=face&q=85';
