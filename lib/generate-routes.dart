import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/screens/configuration/configuration.dart';
import 'package:cinephile_flutter/screens/search/search.dart';
import 'package:cinephile_flutter/screens/movies/movies.dart';
import 'package:cinephile_flutter/screens/movie-detail/movie-detail.dart';
import 'package:cinephile_flutter/screens/movie-trailer/movie-trailer.dart';
import 'package:cinephile_flutter/screens/movie-gallery/movie-gallery.dart';
import 'package:cinephile_flutter/arguments/movie-trailer.dart';
import 'package:cinephile_flutter/arguments/movie-detail.dart';
import 'package:cinephile_flutter/arguments/movie-gallery.dart';
import 'package:cinephile_flutter/arguments/movies.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case MoviesScreen.route:
        final MoviesArguments args = arguments;

        return MaterialPageRoute(
          builder: (_) => MoviesScreen(
            id: args.id,
            name: args.name,
            typeRequest: args.typeRequest,
          ),
        );
        break;
      case MovieDetailScreen.route:
        final MovieDetailArguments args = arguments;

        return MaterialPageRoute(
            builder: (_) => MovieDetailScreen(id: args.id));
        break;
      case MovieTrailerScreen.route:
        final MovieTrailerArguments args = arguments;

        return MaterialPageRoute(
            builder: (_) => MovieTrailerScreen(youtubeKey: args.youtubeKey));
        break;
      case MovieGalleryScreen.route:
        final MovieGalleryArguments args = arguments;

        return MaterialPageRoute(
            builder: (_) => MovieGalleryScreen(images: args.images));
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
