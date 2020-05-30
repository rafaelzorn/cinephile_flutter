import 'package:flutter/material.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class ConfigurationPage extends StatelessWidget {
  // route
  static final String route = '/configuration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.MORE),
      ),
      body: Container(),
    );
  }
}
