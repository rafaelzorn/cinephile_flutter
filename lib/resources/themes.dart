import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';

class CfThemes {
  static ThemeData get primary => ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: CfColors.WHITE,
        appBarTheme: AppBarTheme(
          color: CfColors.WHITE,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: CfColors.DARK_BLUE),
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: CfColors.DARK_BLUE,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 16,
            color: CfColors.DARK_BLUE,
            letterSpacing: 0.5,
          ),
        ),
        accentColor: CfColors.DARK_BLUE,
      );
}
