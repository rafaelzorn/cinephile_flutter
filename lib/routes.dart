import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/screens/movies/movies.dart';

Map<String, WidgetBuilder> routes(context) => ({
      MoviesScreen.route: (context) {
        final Map arguments = ModalRoute.of(context).settings.arguments;

        return MoviesScreen(arguments: arguments);
      },
    });
