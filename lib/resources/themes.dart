import 'package:flutter/material.dart';
import 'package:cinephile_flutter/resources/colors.dart';

class CfThemes {
  static ThemeData get primary => ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: CfColors.WHITE,
        appBarTheme: AppBarTheme(
          color: CfColors.WHITE,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: CfColors.DARK_BLUE,
          ),
        ),
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: CfColors.DARK_BLUE,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 16,
            color: CfColors.DARK_BLUE,
            letterSpacing: 0.5,
          ),
        ),
        accentColor: CfColors.DARK_BLUE,
      );
}
