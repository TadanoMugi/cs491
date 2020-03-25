import 'package:flutter/material.dart';

/* ==================================================
// imports to other pages collected here
================================================== */
import '_user_favorites_page.dart';
import '_user_history_page.dart';
import '_user_preferences_page.dart';
import 'database.dart';
import '_home_page.dart';
import '_result_page.dart';
import 'routing_constants.dart';
import '_search_page.dart';
import 'test_page.dart';
import 'undefined_view.dart';
import '_login_page.dart';
import '_register_page.dart';

/* ==================================================
// switch for controlling routes between pages
================================================== */
Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePageView());
    case SearchPageRoute:
      return MaterialPageRoute(builder: (context) => SearchPageView());
    case DatabasePageRoute:
      return MaterialPageRoute(builder: (context) => DatabasePageView());
    case ResultPageRoute:
      return MaterialPageRoute(builder: (context) => ResultPageView());
    case LoginPageRoute:
      return MaterialPageRoute(builder: (context) => LoginPageView());
    case RegisterPageRoute:
      return MaterialPageRoute(builder: (context) => RegisterPageView());
    case DatabasePageRoute:
      return MaterialPageRoute(builder: (context) => DatabasePageView());
    case HistoryPageRoute:
      return MaterialPageRoute(builder: (context) => HistoryPageView());
    case FavoritesPageRoute:
      return MaterialPageRoute(builder: (context) => FavoritesPageView());
    case PreferencesPageRoute:
      return MaterialPageRoute(builder: (context) => PreferencesPageView());

    case TestPageRoute: /*temporary page*/
      return MaterialPageRoute(builder: (context) => TestPageView());
    default: 
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}