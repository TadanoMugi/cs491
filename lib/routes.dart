import 'package:flutter/material.dart';

import 'home_page.dart';
import 'result_page.dart';
import 'routing_constants.dart';
import 'search_page.dart';
import 'undefined_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePageView());
    case SearchPageRoute:
      return MaterialPageRoute(builder: (context) => SearchPageView());
    case ResultPageRoute:
      return MaterialPageRoute(builder: (context) => ResultPageView());
    default: 
      return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name));
  }
}