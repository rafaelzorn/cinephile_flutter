import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/themes.dart';
import 'package:cinephile_flutter/pages/home/home.dart';
import 'package:cinephile_flutter/resources/strings.dart';

Future main() async {
  await DotEnv().load('.env');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CfColors.WHITE,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: CfStrings.APP_NAME,
      theme: CfThemes.primary,
      home: HomePage(),
    );
  }
}
