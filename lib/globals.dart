import 'recipe_class.dart';

List<Recipe> databaseTable;   // Database copy
List<Recipe> perfectMatchList; // Results list: exact matches
bool loggedIn = false;


String tempurl = 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F5642837.jpg&w=596&h=792.6800000000001&c=sc&poi=face&q=85';