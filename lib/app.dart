import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/screens/movies/movies.dart';
import 'package:cinephile_flutter/screens/search/search.dart';
import 'package:cinephile_flutter/screens/configuration/configuration.dart';
import 'package:cinephile_flutter/widgets/bottom-navigation-bar.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // state
  int indexStack = 0;

  void _handleIndexStack({int index}) {
    setState(() {
      indexStack = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: indexStack,
        children: <Widget>[
          MoviesScreen(),
          SearchScreen(),
          ConfigurationScreen(),
        ],
      ),
      bottomNavigationBar: CfBottomNavigationBar(
        handleIndexStack: (index) => _handleIndexStack(index: index),
        currentIndex: indexStack,
      ),
    );
  }
}
