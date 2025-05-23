import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Cf
import 'package:cinephile_flutter/app.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/themes.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/services/navigation.dart';
import 'package:cinephile_flutter/generate-routes.dart';

Future main() async {
  await DotEnv().load('.env');

  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: CfColors.WHITE),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: CfStrings.APP_NAME,
      theme: CfThemes.primary,
      onGenerateRoute: GenerateRoute.generateRoute,
      home: App(),
      navigatorKey: NavigationService().navigatorKey,
    );
  }
}
