import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/screens/movies/movies.dart';
import 'package:cinephile_flutter/screens/search/search.dart';
import 'package:cinephile_flutter/screens/configuration/configuration.dart';
import 'package:cinephile_flutter/widgets/bottom-navigation-bar.dart';
import 'package:cinephile_flutter/store/mobx.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  // state
  int indexStack = 0;

  AsMobx _mobx = AsMobx();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _mobx.configurationStore.initializeConfigurationStore();
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _mobx.configurationStore.initializeConfigurationStore();
    }
  }

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
