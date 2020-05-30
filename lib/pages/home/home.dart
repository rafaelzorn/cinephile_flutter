import 'package:flutter/material.dart';
import 'package:cinephile_flutter/pages/movies/movies.dart';
import 'package:cinephile_flutter/pages/search/search.dart';
import 'package:cinephile_flutter/pages/configuration/configuration.dart';
import 'package:cinephile_flutter/widgets/bottom-navigation-bar.dart';

class HomePage extends StatefulWidget {
  // route
  static final String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // controller
  PageController _pageController;

  // state
  int tab = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (currentPage) {
          setState(() {
            tab = currentPage;
          });
        },
        controller: _pageController,
        children: <Widget>[
          MoviesPage(),
          SearchPage(),
          ConfigurationPage(),
        ],
      ),
      bottomNavigationBar: CfBottomNavigationBar(
        pageController: _pageController,
        currentIndex: tab,
      ),
    );
  }
}
