import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';

class SearchScreen extends StatelessWidget {
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
