import 'package:flutter/material.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class SearchPage extends StatelessWidget {
  // route
  static final String route = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.SEARCH),
      ),
      body: Container(),
    );
  }
}
