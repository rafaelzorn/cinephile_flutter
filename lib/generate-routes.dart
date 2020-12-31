import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/screens/configuration/configuration.dart';
import 'package:cinephile_flutter/screens/search/search.dart';
import 'package:cinephile_flutter/screens/movies/movies.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case MoviesScreen.route:
        return MaterialPageRoute(
            builder: (_) => MoviesScreen(arguments: arguments));
        break;
      case SearchScreen.route:
        return MaterialPageRoute(builder: (_) => SearchScreen());
        break;
      case ConfigurationScreen.route:
        return MaterialPageRoute(builder: (_) => ConfigurationScreen());
        break;
      default:
        return null;
    }
  }
}
