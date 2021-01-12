import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/screens/configuration/configuration.dart';
import 'package:cinephile_flutter/screens/search/search.dart';
import 'package:cinephile_flutter/screens/movies/movies.dart';
import 'package:cinephile_flutter/screens/movie-detail/movie-detail.dart';
import 'package:cinephile_flutter/screens/movie-trailer/movie-trailer.dart';
import 'package:cinephile_flutter/screens/movie-gallery/movie-gallery.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case MoviesScreen.route:
        return MaterialPageRoute(
            builder: (_) => MoviesScreen(arguments: arguments));
        break;
      case MovieDetailScreen.route:
        return MaterialPageRoute(
            builder: (_) => MovieDetailScreen(arguments: arguments));
        break;
      case MovieTrailerScreen.route:
        return MaterialPageRoute(
            builder: (_) => MovieTrailerScreen(arguments: arguments));
        break;
      case MovieGalleryScreen.route:
        return MaterialPageRoute(
            builder: (_) => MovieGalleryScreen(arguments: arguments));
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
