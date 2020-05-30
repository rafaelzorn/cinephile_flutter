import 'package:flutter/material.dart';
import 'package:cinephile_flutter/pages/movies/movies.dart';
import 'package:cinephile_flutter/pages/search/search.dart';
import 'package:cinephile_flutter/pages/configuration/configuration.dart';
import 'package:cinephile_flutter/widgets/bottom-navigation-bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // state
  int tab = 0;

  void handleChangeTab(index) {
    setState(() {
      tab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: <Widget>[
          MoviesPage(),
          SearchPage(),
          ConfigurationPage(),
        ],
      ),
      bottomNavigationBar: CfBottomNavigationBar(
        handleChangeTab: handleChangeTab,
        currentIndex: tab,
      ),
    );
  }
}
